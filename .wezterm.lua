local wezterm = require 'wezterm'
local config = {
    -- Changing default font size
    font_size = 18.0,

    -- Cursor animation
    animation_fps = 60,
    cursor_blink_rate = 500,

    -- Window settings
    adjust_window_size_when_changing_font_size = true,
    window_padding = {
        left = 25,
        right = 25,
        top = 20,
        bottom = 20,
    },
    window_background_opacity = 0.87,
    window_decorations = "NONE | RESIZE",
    window_frame = {
    font = wezterm.font({ family = "Iosevka Custom", weight = "Regular" }),
    active_titlebar_bg = "#0c0b0f",
},

    -- Keybindings
    keys = {
        { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
        { key = 't', mods = 'CTRL', action = wezterm.action.EmitEvent 'toggle-colorscheme' },


	-- creating new windows --
       { 
            key = 'n', 
            mods = 'CTRL|SHIFT', 
            action = wezterm.action.SplitPane {
                direction = "Right",
                size = { Percent = 50 },
            }
        },

},


    -- Automatically reload config
    automatically_reload_config = true,

    -- Color scheme
    color_scheme = "Cloud (terminal.sexy)",
}

-- Toggle color scheme between Zenburn and Cloud (terminal.sexy)
wezterm.on('toggle-colorscheme', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if overrides.color_scheme == "Cloud (terminal.sexy)" then
        overrides.color_scheme = "Zenburn"
    else
        overrides.color_scheme = "Cloud (terminal.sexy)"
    end
    window:set_config_overrides(overrides)
end)

return config
