M = {}

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

	local handle = io.popen("ls '" .. path .. "' 2>&1 || echo __LS_FAILED__")
	if handle then
		local output = handle:read("*a")
		handle:close()

		if output:find("__LS_FAILED__", 1, true) then
			hl.notification.create({
				text = ("bulk_require: \"%s\""):format(output),
				icon = "error",
				timeout = 5000
			})

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
	local root = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hypr"
	local list = {}

	if not modules then
		list = find_modules(root .. '/' .. base:gsub("%.", '/'), skips)
	else
		list = modules
	end

	if #list ~= 0 then
		for _, module in ipairs(modules or list) do
			local name = base .. '.' .. module
			local ok, error = pcall(require, name)

			if not ok then
				hl.notification.create({
					text = ("bulk_require: failed loading \"%s\"%s"):format(name, error),
					icon = "error",
					timeout = 5000
				})
			end
		end
	else
		hl.notification.create({
			text = ("bulk_require: no modules found in \"%s\""):format(base),
			icon = "error",
			timeout = 5000
		})
	end
end

return M
