local modules = {
    "variables",
    "extras",
    "autostart",
    "environment",
    "monitors",
    "programs",
    "permissions",
    "look",
    "colors",
    "input",
    "keybindings",
    "rules",
    "xwayland",
    "layouts",
    "render",
    "misc"
}

require("utilities").bulk_require("land")
