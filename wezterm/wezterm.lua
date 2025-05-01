-- WezTerm Keybindings
-- ===================================================

-- 1. Tab Management:
--    - Ctrl + t: Create a new tab in the current pane's domain.
--    - Ctrl + w: Close the current pane (with confirmation).
--    - Alt + [1–9]: Switch to a specific tab (1–9).
--    - Ctrl + Shift + r: Rename the current tab via prompt.

-- 2. Pane Splitting:
--    - Ctrl + v: Split the current pane horizontally.
--    - Ctrl + s: Split the current pane vertically.

-- 3. Pane Navigation:
--    - Ctrl + h: Move to the pane on the left.
--    - Ctrl + j: Move to the pane below.
--    - Ctrl + k: Move to the pane above.
--    - Ctrl + l: Move to the pane on the right.

-- 4. Pane Resizing:
--    - Ctrl + LeftArrow: Resize the pane to the left.
--    - Ctrl + RightArrow: Resize the pane to the right.
--    - Ctrl + DownArrow: Resize the pane downward.
--    - Ctrl + UpArrow: Resize the pane upward.

-- ===================================================

local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.automatically_reload_config = true

-- Set initial window size
config.initial_rows = 25
config.initial_cols = 105

-- Set PowerShell as the default shell
config.default_prog = { "pwsh.exe", "-NoLogo" }

-- Enable window resizing while disabling the native title bar
-- config.window_decorations = "RESIZE"

-- Apply the preferred color scheme
config.color_scheme = 'OneDark (base16)'

-- Tab bar configuration
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
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

-- Keybindings
-- config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {

    -- Close current pane
    { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true } },
    -- Spawn new tab
    { key = 't', mods = 'ALT', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },

    -- Pane split (horizontal and vertical)
    { key = 'v', mods = 'ALT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 's', mods = 'ALT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

    -- Move focus (like Vim hjkl)
    { key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },

    -- Resize with Arrow Keys
    { key = 'LeftArrow',  mods = 'ALT', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
    { key = 'RightArrow', mods = 'ALT', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
    { key = 'UpArrow',    mods = 'ALT', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
    { key = 'DownArrow',  mods = 'ALT', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },

    -- Switch tab
    { key = '1', mods = 'ALT', action = wezterm.action.ActivateTab(0) },
    { key = '2', mods = 'ALT', action = wezterm.action.ActivateTab(1) },
    { key = '3', mods = 'ALT', action = wezterm.action.ActivateTab(2) },
    { key = '4', mods = 'ALT', action = wezterm.action.ActivateTab(3) },
    { key = '5', mods = 'ALT', action = wezterm.action.ActivateTab(4) },
    { key = '6', mods = 'ALT', action = wezterm.action.ActivateTab(5) },
    { key = '7', mods = 'ALT', action = wezterm.action.ActivateTab(6) },
    { key = '8', mods = 'ALT', action = wezterm.action.ActivateTab(7) },
    { key = '9', mods = 'ALT', action = wezterm.action.ActivateTab(8) },

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
}

return config