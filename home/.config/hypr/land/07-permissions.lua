hl.config({
    ecosystem = { enforce_permissions = true }
})

local function binaryPath(name)
	return "/nix/store/[a-z0-9]{32}-"..name.."-[0-9.]*/bin/"..name
end

local permissions = {
	["hyprpm"] = "plugin",
	["grim"] = "screencopy",
	["xdg-desktop-portal-hyprland"] = "screencopy",
	["hyprlock"] = "screencopy",
	["hypridle"] = "screencopy",
	["hyprsunset"] = "screencopy"
};

for binary, type in pairs(permissions) do
	hl.permission({
		binary = binaryPath(binary),
		type = type,
		mode = "allow"
	})
end
