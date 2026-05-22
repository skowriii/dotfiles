hl.config({
    general = {
        col = {
            active_border = {
                colors = {
                    "{{colors.primary.default.rgba}}",
                    "{{colors.on_primary.default.rgba}}",
                    "{{colors.primary_container.default.rgba}}",
                    "{{colors.secondary.default.rgba}}",
                    "{{colors.on_secondary.default.rgba}}",
                    "{{colors.secondary_container.default.rgba}}"
                }
            }
        },

        inactive_border = { "rgba({{colors.background.default.hex_stripped}}ee)" }
    }
})
