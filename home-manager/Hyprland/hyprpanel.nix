{ inputs, config, pkgs, ... }:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];
  home.file.".config/hyprpanel/config".text = ''
    # Enable Hyprpanel and its features
    enable = true
    overlay.enable = true
    hyprland.enable = true
    overwrite.enable = true

    # Theme overrides
    override.theme.bar.background = "#1d1a2f"
    override.theme.bar.text = "#8bd450"
    override.theme.bar.active = "#965fd4"
    override.theme.bar.inactive = "#734f9a"
    override.theme.menu.background = "#1d1a2f"
    override.theme.menu.text = "#8bd450"
    override.theme.menu.highlight = "#965fd4"
    override.theme.menu.border = "#3f6d4e"

    # Bar layout configuration
    layout.bar.layout.0.left = ["dashboard" "workspaces"]
    layout.bar.layout.0.middle = ["windowtitle"]
    layout.bar.layout.0.right = ["systray" "volume" "clock"]
    layout.bar.layout.1.left = []
    layout.bar.layout.1.middle = []
    layout.bar.layout.1.right = []

    # Settings
    settings.bar.launcher.autoDetectIcon = true
    settings.bar.workspaces.show_numbered = true
    settings.bar.workspaces.ignored = "(-\\\\d+)"
    settings.bar.clock.format = "%H:%M 󰃭 %m/%d/%Y"
    settings.bar.clock.icon = ""
    settings.menus.dashboard.shortcuts.left.shortcut1.command = "firefox"
    settings.menus.dashboard.shortcuts.left.shortcut1.tooltip = "Firefox"
    settings.menus.dashboard.shortcuts.left.shortcut3.command = "webcord"
    settings.menus.dashboard.shortcuts.left.shortcut2.command = "spotify"
    settings.menus.dashboard.powermenu.avatar.image = "~/.home/imgs/icon.png"
    settings.bar.windowtitle.custom_title = true
    settings.menus.clock.time.military = true
    settings.menus.clock.time.hideSeconds = false
    settings.menus.dashboard.directories.enabled = false
    settings.menus.dashboard.stats.enable_gpu = true
    settings.theme.bar.transparent = true
    settings.theme.font.name = "JetBrainsMono Nerd Font"
    settings.theme.font.size = "12px"
  '';
}