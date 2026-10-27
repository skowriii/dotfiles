local flake = "/personal/dotfiles/nixos"
local getFlake = ("(builtins.getFlake \"%s\")"):format(flake)

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("nixd", {
	settings = {
		nixd = {
			nixpkgs = { expr = ("import %s.inputs.nixpkgs {}"):format(getFlake) },
			options = {
				nixos = { expr = ("%s.nixosConfigurations.nixbob.options"):format(getFlake) },
				home_manager = {
					expr = ("%s.nixosConfigurations.nixbob.options.home-manager.users.type.getSubOptions []"):format(getFlake)
				}
			}
		}
	},
	capabilities = capabilities
})

vim.lsp.enable("nixd")
