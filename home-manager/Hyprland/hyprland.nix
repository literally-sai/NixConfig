{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    settings = {
      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$fileManager" = "${pkgs.nautilus}/bin/nautilus";
      "$menu" = "${pkgs.rofi-wayland}/bin/rofi -show drun";
      "$cliFM" = "$terminal -e ${pkgs.yazi}/bin/yazi";
      "$MOD" = "SUPER";

      exec-once = [
        "${pkgs.hyprlock}/bin/hyprlock"
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.hyprpanel}/bin/hyprpanel"
        "${pkgs.hyprshade}/bin/hyprshade on vibrance"
        "${pkgs.hypridle}/bin/hypridle"
      ];

      monitor = ",preferred,auto,auto";

      general = {
        gaps_in = 2;
        gaps_out = 10;
        border_size = 2;
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
      };

      bind =
        [
          "$MOD, Q, exec, $terminal"
          "$MOD, C, killactive,"
          "$MOD, W, exec, $terminal -e nvim"
          "$MOD, V, fullscreen,"
          "$MOD ALT, V, togglefloating,"
          "$MOD SHIFT, V, exec, pypr toggle term && hyprctl dispatch bringactivetotop"
          "$MOD SHIFT, U, exec, hyprlock"
          "$MOD, E, exec, $menu"
          "$MOD, R, exec, $cliFM"
          "$MOD, Shift Space, togglesplit,"
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
          "$MOD, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%+"
          "$MOD, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%-"
          "$MOD SHIFT, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%"
          "$MOD SHIFT, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"
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
