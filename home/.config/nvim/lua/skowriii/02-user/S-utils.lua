local M = {}

local function find_modules(path, skips)
	local list = {}
	local found_init = false

	if not skips then
		skips = { "init" }
	else
		for _, skip in ipairs(skips) do
			if skip == "init" then
				found_init = true
			end
		end

		if not found_init then
			table.insert(skips, "init")
		end
	end

	local handle = io.popen("ls '" .. path .. "' 2>&1")
	if handle then
		local output = handle:read("*a")
		local ok = handle:close()

		if not ok then
			vim.notify(
				("bulk_require: \"%s\""):format(output),
				vim.log.levels.ERROR
			)

			return {}
		end

		for item in output:gmatch("[^\r\n]+") do
			local skipped = false
			local filename = item:gsub("%.lua$", '')

			for _, skip in ipairs(skips) do
				if filename == skip or filename:match("^S%-") then
					skipped = true
					break
				end
			end

			if not skipped then
				table.insert(list, filename)
			end
		end

		return list
	end

	return {}
end

function M.bulk_require(base, modules, skips)
	local list = {}

	if not modules then
		list = find_modules(vim.fn.stdpath("config") .. "/lua/" .. base:gsub("%.", '/'), skips)
	else
		list = modules
	end

	if #list ~= 0 then
		for _, module in ipairs(modules or list) do
			local name = base .. '.' .. module
			local ok, error = pcall(require, name)

			if not ok then
				vim.notify(
					("bulk_require: failed loading \"%s\"%s"):format(name, error),
					vim.log.levels.ERROR
				)
			end
		end
	else
		vim.notify(
			("bulk_require: no modules found in \"%s\""):format(base),
			vim.log.levels.INFO
		)
	end
end

function M.setup_capabilities(server)
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	vim.lsp.config(server, {
		capabilities = capabilities
	})
end

return M
