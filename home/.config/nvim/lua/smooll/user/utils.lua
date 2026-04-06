local M = {}

function M.bulk_require(base, modules)
	for _, module in ipairs(modules) do
		local name = base .. '.' .. module
		local ok, error = pcall(require, name)

		if not ok then
			vim.notify(
				("bulk_require: failed loading \"%s\"\n%s"):format(name, error),
				vim.log.levels.ERROR
			)
		end
	end
end

function M.setup_capabilities(server)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config(server, {
        capabilities = capabilities
    })
end

return M
