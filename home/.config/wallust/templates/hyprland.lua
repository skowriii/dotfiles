hl.config({
    general = {
        col = {
            active_border = {
                colors = {
                    "rgb({{color1 | saturate(0.6) | strip}})",
                    "rgb({{color2 | saturate(0.6) | strip}})",
                    "rgb({{color3 | saturate(0.6) | strip}})",
                    "rgb({{color4 | saturate(0.6) | strip}})",
                    "rgb({{color5 | saturate(0.6) | strip}})",
                    "rgb({{color6 | saturate(0.6) | strip}})"
                }
            }
        },

        inactive_border = { "rgba({{color0 | strip}}ee)" }
    }
})
