{
  pkgs,
  ...
}:
{
wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$terminal" = "${pkgs.ghostty}/bin/ghostty";
      "$fileManager" = "${pkgs.nautilus}/bin/nautilus";
      "$menu" = "${pkgs.rofi-wayland}/bin/rofi -show drun";
      "$cliFM" = "$terminal -e ${pkgs.yazi}/bin/yazi";
      "$MOD" = "SUPER";
      exec-once = [
        "hyprpaper &"
        "hyprlock &"
        "pypr &"
        "${pkgs.hyprshade}/bin/hyprshade on vibrance"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
        "solaar"
        "${pkgs.hypridle}/bin/hypridle &"
      ];
      monitor = [
        "monitor=,preferred,auto,auto"
      ];
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
          "windows, 1,7, myBezier"
          "windowsOut, 1,7, default, popin 80%"
          "border, 1,7, default"
          "borderangle, 1,8, default"
          "fade, 1,7, default"
          "workspaces, 1,7, default"
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
        sensitivity = -0.5;
        touchpad = {
          natural_scroll = false;
        };
      };
      bind = [
        "$MOD, Q, exec, $terminal"
        "$MOD, C, killactive"
        "$MOD, N, exec, $notes"
        "$MOD, W, exec, $terminal nvim"
        "$MOD, Space, fullscreen"
        "$MOD, Alt Space, togglefloating"
        "$MOD, Shift Space, togglesplit"
        "$MOD, E, exec, $menu"
        "$MOD, R, exec, $cliFM"
        "$MOD Alt, L, exec, hyprlock"
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
        "$MOD, 1, workspace, 1"
        "$MOD, 2, workspace, 2"
        "$MOD, 3, workspace, 3"
        "$MOD, 4, workspace, 4"
        "$MOD, 5, workspace, 5"
        "$MOD, 6, workspace, 6"
        "$MOD, 7, workspace, 7"
        "$MOD, 8, workspace, 8"
        "$MOD, 9, workspace, 9"
        "$MOD, 0, workspace, 10"
        "$MOD SHIFT, 1, movetoworkspace, 1"
        "$MOD SHIFT, 2, movetoworkspace, 2"
        "$MOD SHIFT, 3, movetoworkspace, 3"
        "$MOD SHIFT, 4, movetoworkspace, 4"
        "$MOD SHIFT, 5, movetoworkspace, 5"
        "$MOD SHIFT, 6, movetoworkspace, 6"
        "$MOD SHIFT, 7, movetoworkspace, 7"
        "$MOD SHIFT, 8, movetoworkspace, 8"
        "$MOD SHIFT, 9, movetoworkspace, 9"
        "$MOD SHIFT, 0, movetoworkspace, 10"
        "$MOD, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%+"
        "$MOD, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%-"
        "$MOD SHIFT, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%"
        "$MOD SHIFT, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"
      ];
      bindm = [
        "$MOD, mouse:272, movewindow"
        "$MOD, mouse:273, resizewindow"
      ];
    };
  };
}