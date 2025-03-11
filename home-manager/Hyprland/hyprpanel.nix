{ inputs, config, pkgs, ... }:
let
  iconImage = pkgs.runCommand "icon-image" {} ''
    mkdir -p $out
    cp ${../../imgs/icon.png} $out/icon.png
  '';
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];
  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;

    override = {
      theme = {
        bar = {
          background = "#1d1a2f";
          text = "#8bd450";
          active = "#965fd4";
          inactive = "#734f9a";
        };
        menu = {
          background = "#1d1a2f";
          text = "#8bd450";
          highlight = "#965fd4";
          border = "#3f6d4e";
        };
      };
    };

    layout = {
      "bar.layout" = {
        "0" = {
          left = [
            "dashboard"
            "workspaces"
          ];
          middle = [ "windowtitle" ];
          right = [
            "systray"
            "volume"
            "clock"
          ];
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
      menus.dashboard.shortcuts.left.shortcut1.command = "firefox";
      menus.dashboard.shortcuts.left.shortcut1.icon = "";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Firefox";
      menus.dashboard.shortcuts.left.shortcut3.command = "webcord";
      menus.dashboard.shortcuts.left.shortcut2.command = "spotify";
      menus.dashboard.powermenu.avatar.image = "${iconImage}/icon.png";
      bar.windowtitle.custom_title = true;
      menus.clock = {
        time = {
          military = true;
          hideSeconds = false;
        };
      };
      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;
      theme.bar.transparent = true;
      theme.font = {
        name = "JetBrainsMono Nerd Font";
        size = "16px";
      };
    };
  };
}