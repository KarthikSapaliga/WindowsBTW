-- WezTerm Keybindings Documentation
-- ============================================================

-- 1. Tab Management
--    - Ctrl + Shift + T: Open a new tab in the current pane’s domain.
--    - Ctrl + Shift + W: Close the current pane with confirmation.
--    - Ctrl + Shift + [1–9]: Switch directly to tab 1 through 9.
--    - Ctrl + Shift + R: Rename the current tab via input prompt.

-- 2. Pane Splitting
--    - Ctrl + Shift + D: Split the current pane horizontally.
--    - Ctrl + Shift + E: Split the current pane vertically.

-- 3. Pane Navigation (Vim-style movement)
--    - Ctrl + Shift + H: Move focus to the pane on the left.
--    - Ctrl + Shift + J: Move focus to the pane below.
--    - Ctrl + Shift + K: Move focus to the pane above.
--    - Ctrl + Shift + L: Move focus to the pane on the right.

-- 4. Pane Resizing
--    - Ctrl + Shift + LeftArrow: Shrink the pane to the left.
--    - Ctrl + Shift + RightArrow: Expand the pane to the right.
--    - Ctrl + Shift + UpArrow: Shrink the pane upward.
--    - Ctrl + Shift + DownArrow: Expand the pane downward.

-- 5. Clipboard Operations
--    - Ctrl + Shift + C: Copy selected text to the clipboard.
--    - Ctrl + Shift + V: Paste content from the clipboard.

-- 6. Font Size Controls
--    - Ctrl + Shift + =: Increase font size.
--    - Ctrl + Shift + -: Decrease font size.
--    - Ctrl + Shift + 0: Reset font size to default.

-- ============================================================

local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.automatically_reload_config = true

-- Set initial window size
config.initial_rows = 25
config.initial_cols = 105

-- Set PowerShell as the default shell
config.default_prog = { "pwsh.exe", "-NoLogo" }

-- Enable window resizing while disabling the native title bar
config.window_decorations = "RESIZE"

-- Change the default padding
-- config.window_padding = {
--   left = 0,
--   right = 0,
--   top = 0,
--   bottom = 0,
-- }

-- Backdrope
-- config.window_background_opacity = 0.5
-- config.win32_system_backdrop = 'Mica'

-- Apply the preferred color scheme
config.color_scheme = 'OneDark (base16)'

-- Tab bar configuration
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_and_split_indices_are_zero_based = false

-- Define custom tab bar appearance
config.colors = {
    tab_bar = {
        background = "#1e2227",

        active_tab = {
            bg_color = "#89b4fa",
            fg_color = "#1e2227",
            intensity = "Bold",
            underline = "None",
            italic = false,
            strikethrough = false,
        },

        inactive_tab = {
            bg_color = "#1e2227",
            fg_color = "#7f848e",
        },

        inactive_tab_hover = {
            bg_color = "#313244",
            fg_color = "#7f848e",
        },

        new_tab = {
            bg_color = "#1e2227",
            fg_color = "#89b4fa",
        },

        new_tab_hover = {
            bg_color = "#313244",
            fg_color = "#7f848e",
        },
    },
}

-- Configure the default cursor style
config.default_cursor_style = "BlinkingBar"

-- Set font preferences
config.font = wezterm.font("JetBrainsMono Nerd Font Propo", { weight = "Regular" })
config.font_size = 12

-- Enable mouse interactions (right-click paste)
config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action.PasteFrom("Clipboard"),
    },
}

-- Keybindings
-- config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {

    -- Close current pane
    { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = true } },
    -- Spawn new tab
    { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },

    -- Pane split (horizontal and vertical)
    { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'e', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

    -- Move focus (like Vim hjkl)
    { key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down' },

    -- Resize with Arrow Keys
    { key = 'LeftArrow',  mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
    { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
    { key = 'UpArrow',    mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
    { key = 'DownArrow',  mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },

    -- Switch tab
    { key = '1', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(0) },
    { key = '2', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(1) },
    { key = '3', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(2) },
    { key = '4', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(3) },
    { key = '5', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(4) },
    { key = '6', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(5) },
    { key = '7', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(6) },
    { key = '8', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(7) },
    { key = '9', mods = 'CTRL|SHIFT', action = wezterm.action.ActivateTab(8) },

    -- Copy/Paste
    { key="c", mods="CTRL|SHIFT", action=wezterm.action.CopyTo("Clipboard")},
    { key="v", mods="CTRL|SHIFT", action=wezterm.action.PasteFrom("Clipboard")},

    -- Font size adjustments
    { key="=", mods="CTRL|SHIFT", action="IncreaseFontSize"},
    { key="-", mods="CTRL|SHIFT", action="DecreaseFontSize"},
    { key="0", mods="CTRL|SHIFT", action="ResetFontSize"},

    -- Rename tab
    {
        key = 'r',
        mods = "CTRL|SHIFT",
        action = wezterm.action.PromptInputLine {
            description = 'Rename Tab',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end)
        }
    },

    -- Toggle pane zoom
    { key = "z", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },

    -- Toggle fullscreen
    { key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },
}

return config