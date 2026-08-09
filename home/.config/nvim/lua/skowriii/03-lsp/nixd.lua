local flake = "/personal/dotfiles/nixos"
local getFlake = ("(builtins.getFlake \"%s\")"):format(flake)

require("skowriii.02-user.S-utils").setup_capabilities("nixd")

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
	}
})
vim.lsp.enable("nixd")
