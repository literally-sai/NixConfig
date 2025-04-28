{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overlay.enable = true;
    overwrite.enable = true;
    config.enable = true;

    override = {
      "bar.launcher.icon" = "${config.home.homeDirectory}/resources/panel_icon.jpg";
    };

    settings = {
      theme = {
        name = "catppuccin_mocha";
        font = {
          name = "JetBrainsMono Nerd Font";
          size = "1.1rem";
          weight = 500;
        };
        bar = {
          transparent = true;
          opacity = 85;
          scaling = 100;
          floating = true;
          layer = "top";
          location = "top";
          margin_top = "0.4em";
          margin_sides = "0.6em";
          margin_bottom = "0em";
          border = {
            location = "none";
            width = "0em";
          };
          shadow = "0px 1px 3px 1px #1e1e2e";
          shadowMargins = "0px 0px 4px 0px";
          buttons = {
            style = "default";
            monochrome = false;
            opacity = 90;
            radius = "0.4em";
            padding_x = "0.6rem";
            padding_y = "0.2rem";
            spacing = "0.3em";
            y_margins = "0.3em";
            enableBorders = false;
          };
          menus = {
            opacity = 90;
            border = {
              radius = "0.6em";
              size = "0.1em";
            };
            card_radius = "0.5em";
            enableShadow = true;
            shadow = "0px 0px 4px 1px #1e1e2e";
            shadowMargins = "4px 4px";
            menu = {
              clock = {
                scaling = 70;
              };
              dashboard = {
                scaling = 100;
                profile = {
                  radius = "0.4em";
                  size = "8em";
                };
              };
            };
          };
        };
        notification = {
          opacity = 90;
          enableShadow = true;
          shadow = "0px 1px 3px 1px #1e1e2e";
          shadowMargins = "4px 4px";
          scaling = 100;
        };
        osd = {
          enable = true;
          location = "right";
          orientation = "vertical";
          radius = "0.4em";
          opacity = 90;
          duration = 2000;
          margins = "0px 5px 0px 0px";
        };
      };

      layout = {
        "bar.layouts" = {
          "0" = {
            left = [
              "launcher"
              "workspaces"
              "windowtitle"
            ];
            middle = [ ];
            right = [
              "volume"
              "network"
              "clock"
              "systray"
            ];
          };
          "1" = {
            left = [
              "launcher"
              "workspaces"
            ];
            middle = [ ];
            right = [
              "volume"
              "clock"
              "systray"
            ];
          };
        };
      };

      bar = {
        autoHide = "never";
        scrollSpeed = 5;
        launcher = {
          autoDetectIcon = false;
          icon = "${config.home.homeDirectory}/resources/panel_icon.jpg";
        };
        workspaces = {
          show_numbered = true;
          show_icons = false;
          monitorSpecific = true;
          workspaces = 6;
          spacing = 0.8;
          icons = {
            active = "●";
            available = "○";
            occupied = "◉";
          };
          numbered_active_indicator = "underline";
        };
        windowtitle = {
          label = true;
          icon = true;
          class_name = true;
          truncation = true;
          truncation_size = 40;
        };
        clock = {
          format = "%b %d %H:%M";
          showIcon = true;
          icon = "󰅐";
          showTime = true;
        };
        volume = {
          label = true;
          scrollUp = "${pkgs.hyprpanel}/bin/hyprpanel 'vol +5'";
          scrollDown = "${pkgs.hyprpanel}/bin/hyprpanel 'vol -5'";
        };
        network = {
          label = true;
          showWifiInfo = false;
          truncation = true;
          truncation_size = 8;
        };
        systray = {
          ignore = [ ];
        };
      };

      menus = {
        dashboard = {
          shortcuts = {
            enabled = true;
            left = {
              shortcut1 = {
                command = "firefox";
                icon = "󰈹";
                tooltip = "Firefox";
              };
              shortcut2 = {
                command = "kitty";
                icon = "󰄛";
                tooltip = "Terminal";
              };
              shortcut3 = {
                command = "sleep 0.5 && hyprpicker -a";
                icon = "󰈊";
                tooltip = "Color Picker";
              };
            };
            right = {
              shortcut1 = {
                command = "rofi -show drun";
                icon = "󰍉";
                tooltip = "App Launcher";
              };
            };
          };
          directories = {
            enabled = true;
            left = {
              directory1 = {
                command = "xdg-open $HOME";
                label = "󰝰 Home";
              };
              directory2 = {
                command = "xdg-open $HOME/Documents";
                label = "󱧶 Documents";
              };
            };
            right = {
              directory1 = {
                command = "xdg-open $HOME/Downloads";
                label = "󰉍 Downloads";
              };
              directory2 = {
                command = "xdg-open $HOME/Pictures";
                label = "󰉏 Pictures";
              };
            };
          };
          stats = {
            enabled = true;
            interval = 2000;
            enable_gpu = false;
          };
          powermenu = {
            confirmation = true;
            avatar = {
              image = "${config.home.homeDirectory}/.face.icon";
              name = "system";
            };
          };
        };
        clock = {
          weather = {
            enabled = true;
            location = "Heidelberg, DE";
            unit = "metric";
            interval = 600000;
          };
          time = {
            hideSeconds = false;
            military = false;
          };
        };
      };

      notifications = {
        position = "top right";
        timeout = 5000;
        displayedTotal = 8;
        clearDelay = 100;
      };

      wallpaper = {
        enable = true;
        image = "${config.home.homeDirectory}/resources/wallpaper.jpeg";
        pywal = false;
      };
    };
  };
}
