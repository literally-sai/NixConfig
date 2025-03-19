{
  inputs,
  config,
  pkgs,
  ...
}:
let
  dir = "${config.home.homeDirectory}";
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;

    override = {
      theme.bar.background = "#1d1a2f";
      theme.bar.text = "#8bd450";
      theme.bar.active = "#965fd4";
      theme.bar.inactive = "#734f9a";
      theme.menu.background = "#1d1a2f";
      theme.menu.text = "#8bd450";
      theme.menu.highlight = "#965fd4";
      theme.menu.border = "#3f6d4e";
      theme.bar.height = "24px";
      theme.menu.scale = 0.8;
    };

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" ];
          middle = [ "windowtitle" ];
          right = [ "systray" "volume" "clock" ];
        };
        "1" = {
          left = [];
          middle = [];
          right = [];
        };
      };
    };

    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_numbered = true;
      bar.workspaces.ignored = "(-\\\\d+)";
      bar.clock.format = "%H:%M 󰃭 %m/%d/%Y";
      bar.clock.icon = "";
      menus.dashboard.shortcuts.left.shortcut1 = {
        command = "firefox";
        tooltip = "Firefox";
      };
      menus.dashboard.shortcuts.left.shortcut2 = {
        command = "spotify";
      };
      menus.dashboard.shortcuts.left.shortcut3 = {
        command = "webcord";
      };
      menus.dashboard.powermenu.avatar.image = "${dir}/.home/imgs/icon.png";
      bar.windowtitle.custom_title = true;
      menus.clock.time = {
        military = true;
        hideSeconds = false;
      };
      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;
      theme.bar.transparent = true;
      theme.font = {
        name = "JetBrainsMono Nerd Font";
        size = "10px";
      };
    };
  };
}