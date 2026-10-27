local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				mccabe = { enabled = false },
				pycodestyle = { enabled = false },
				pyflakes = { enabled = true }
			}
		}
	},
	capabilities = capabilities
})

vim.lsp.enable("pylsp")
