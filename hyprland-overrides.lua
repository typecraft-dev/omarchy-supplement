-- Hyprland configuration overrides
-- Loaded from ~/.config/hypr/hyprland.lua via install-hyprland-overrides.sh,
-- after Omarchy's defaults, so everything here wins.
--
-- API reference:
--   Omarchy helpers (o.*): $OMARCHY_PATH/default/hypr/helpers.lua
--   Hyprland Lua (hl.*):   /usr/share/hypr/stubs/hl.meta.lua
--   Current bindings:      omarchy menu keybindings --print

local terminal = "ghostty"
local browser = "google-chrome-stable"

-- Directory this file lives in, so the script bindings below work wherever the
-- repo is cloned.
local repo_dir = debug.getinfo(1, "S").source:match("^@(.*)/")
  or (os.getenv("HOME") .. "/omarchy-supplement")

-- Use single default monitor (see all monitors with: hyprctl monitors).
-- NOTE: this overrides ~/.config/hypr/monitors.lua, including its scale.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 2 })
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 2, mirror = "eDP-1" })

-- Lid switch handling is left to Omarchy's stock bindings (see
-- $OMARCHY_PATH/default/hypr/bindings/utilities.lua). Those disable the
-- internal panel ONLY when an external monitor is actually connected, so a bare-
-- laptop lid-close suspends cleanly and the screen comes back on resume.
--
-- The unconditional overrides below disabled eDP-1 (the only display) on every
-- lid-close, leaving a black screen after suspend/resume. Kept commented for
-- reference — do NOT re-enable on a laptop without an always-connected external.
-- o.bind("switch:on:Lid Switch", nil, function() hl.monitor({ output = "eDP-1", disabled = true }) end, { locked = true })
-- o.bind("switch:off:Lid Switch", nil, function() hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 2 }) end, { locked = true })

-- Disable the laptop monitor whenever I wish.
-- (Omarchy also ships SUPER + CTRL + Delete for a conditional toggle.)
o.bind("SUPER + SHIFT + L", "Disable laptop display", function()
  hl.monitor({ output = "eDP-1", disabled = true })
end)

-- Re-enable the laptop monitor. SUPER + SHIFT + N is Omarchy's editor binding.
hl.unbind("SUPER + SHIFT + N")
o.bind("SUPER + SHIFT + N", "Enable laptop display", function()
  hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 2 })
end)

o.bind("SUPER + D", "Discord", { webapp = "https://discord.com/channels/@me" })

-- SUPER + C is Omarchy's universal copy; SUPER + K is its keybindings menu.
hl.unbind("SUPER + C")
o.bind("SUPER + C", "Show key bindings", "omarchy-menu-keybindings")

-- SUPER + RETURN is Omarchy's terminal binding (via omarchy-launch-terminal).
hl.unbind("SUPER + RETURN")
o.bind("SUPER + RETURN", "Terminal", { launch = terminal })
o.bind("SUPER + B", "Browser", { launch = browser })

-- Move focus with vim keys. SUPER + J/K/L are bound by Omarchy's defaults
-- (toggle split, keybindings menu, toggle workspace layout).
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")

o.bind("SUPER + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))

o.bind("SUPER + SHIFT + R", "Toggle stream reserved area", repo_dir .. "/toggle-stream-reserved.sh")

hl.config({
  misc = {
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
  },

  input = {
    -- Use multiple keyboard layouts and switch between them with Alt + Space.
    -- kb_layout = "us,dk",
    -- kb_options = "compose:caps,grp:alt_space_toggle",
    kb_options = "ctrl:nocaps",

    -- Change speed of keyboard repeat.
    repeat_rate = 50,
    repeat_delay = 220,

    -- Increase sensitivity for mouse/trackpad (default: 0).
    -- sensitivity = 0.35,

    touchpad = {
      -- Use natural (inverse) scrolling.
      -- natural_scroll = true,
      disable_while_typing = true,
      tap_to_click = false,

      -- Use two-finger clicks for right-click instead of lower-right corner.
      -- clickfinger_behavior = true,

      -- Control the speed of your scrolling.
      scroll_factor = 0.4,
    },
  },
})
