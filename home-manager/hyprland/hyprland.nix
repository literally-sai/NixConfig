{
  pkgs,
  config,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    settings = {
      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$menu" = "${pkgs.rofi-wayland}/bin/rofi -show drun";
      "$MOD" = "SUPER";

      exec-once = [
        "swww init && swww img ${config.home.homeDirectory}/.flake/resources/wallpaper.jpeg"
        "hypridle"
        "hyprpanel"
        "hyprctl setcursor Dracula-cursors 24"
      ];

      general = {
        gaps_in = 1;
        gaps_out = 6;
        border_size = 1;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1695;
        };
      };

      animations = {
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 7, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 7, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      input = {
        kb_layout = "us";
        mouse_refocus = 0;
        accel_profile = "flat";
        follow_mouse = 1;
        sensitivity = 1;
        touchpad = {
          natural_scroll = false;
        };
        tablet = {
          output = "DP-2";
        };
      };

      bind =
        [
          "$MOD, Q, exec, $terminal"
          "$MOD, C, killactive,"
          "$MOD, W, exec, $terminal -e nvim"
          "$MOD, E, exec, $menu"
          "$MOD, U, exec, wlogout"
          "$MOD SHIFT, U, exec, hyprlock"

          "$MOD, V, fullscreen,"
          "$MOD SHIFT, V, togglefloating,"

          "$MOD, H, movefocus, l"
          "$MOD, L, movefocus, r"
          "$MOD, J, movefocus, d"
          "$MOD, K, movefocus, u"

          "$MOD Shift, H, movewindow, l"
          "$MOD Shift, L, movewindow, r"
          "$MOD Shift, J, movewindow, d"
          "$MOD Shift, K, movewindow, u"

          "$MOD ALT, H, resizeactive, 20 0"
          "$MOD ALT, L, resizeactive, -20 0"
          "$MOD ALT, J, resizeactive, 0 -20"
          "$MOD ALT, K, resizeactive, 0 20"

          "$MOD, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"
          "$MOD, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"

          "$MOD SHIFT, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%"
          "$MOD SHIFT, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"

          "$MOD, S, exec, grim -g \"$(slurp -f)\" ~/Downloads/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"
          "$MOD SHIFT, S, exec, grim -g \"$(slurp)\" ~/Downloads/screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$MOD, code:1${toString i}, workspace, ${toString ws}"
              "$MOD SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        ));
      bindm = [
        "$MOD, mouse:272, movewindow"
        "$MOD, mouse:273, resizewindow"
      ];
    };
  };
}
