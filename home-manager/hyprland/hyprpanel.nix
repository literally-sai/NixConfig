{
  inputs,
  config,
  pkgs,
  ...
}:
let
  dir = "${config.home.homeDirectory}/.flake/resources";
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    overwrite.enable = true;

    settings = {
      theme = {
        bar = {
          background = "rgba(30, 36, 54, 0.7)";
          text = "#D8DEE9";
          active = "#81A1C1";
          inactive = "#4C566A";
          height = "22px";
          transparent = true;
        };
        menu = {
          background = "rgba(30, 36, 54, 0.9)";
          text = "#D8DEE9";
          highlight = "#81A1C1";
          border = "rgba(136, 192, 208, 0.3)";
          scale = 0.85;
        };
        font = {
          name = "JetBrainsMono Nerd Font";
          size = "10px";
        };
      };

      bar = {
        autoHide = "fullscreen";
        launcher.autoDetectIcon = true;
        workspaces = {
          show_numbered = true;
          show_icons = true;
          showWsIcons = false;
          showApplicationIcons = false;
          monitorSpecific = true;
          ignored = "(-\\\\d+)";
        };
        clock = {
          format = "%H:%M %m/%d/%Y";
          icon = "";
        };
        media = {
          truncation = true;
          truncation_size = 35;
          displayTime = true;
        };
        network = {
          tooltip = true;
          icon = true;
        };
        bluetooth = {
          tooltip = true;
          icon = true;
        };

        # Move the layout configuration here
        layouts = {
          "0" = {
            left = [
              "dashboard"
              "workspaces"
              "media"
            ];
            middle = [ "windowtitle" ];
            right = [
              "network"
              "bluetooth"
              "volume"
              "clock"
              "systray"
            ];
          };
          "1" = {
            left = [
              "dashboard"
              "workspaces"
              "media"
            ];
            middle = [ "windowtitle" ];
            right = [
              "network"
              "bluetooth"
              "volume"
              "clock"
              "systray"
            ];
          };
        };
      };

      menus = {
        dashboard = {
          shortcuts = {
            left = {
              shortcut1 = {
                command = "firefox";
                tooltip = "Firefox";
              };
              shortcut2 = {
                command = "spotify";
                tooltip = "Spotify";
              };
              shortcut3 = {
                command = "webcord";
                tooltip = "Webcord";
              };
            };
          };
          powermenu = {
            avatar = {
              image = "${dir}/panel_icon.png";
              name = "sai";
            };
            sleep = "hyprctl dispatch dpms off";
          };
          directories.enabled = false;
          stats.enable_gpu = true;
        };
        clock = {
          time = {
            military = true;
            hideSeconds = false;
          };
        };
      };
    };
  };
}
