{
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "${pkgs.ghostty}/bin/ghostty";
      "$fileManager" = "${pkgs.nautilus}/bin/nautilus";
      "$menu" = "${pkgs.rofi-wayland}/bin/rofi -show drun";
      "$cliFM" = "$term -e ${pkgs.yazi}/bin/yazi";
      exec-once = [
        "${pkgs.hyprshade}/bin/hyprshade on vibrance"
        "pypr &"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
        "solaar"
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
        inactive_opacity = 0.8;
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
      "$MOD" = "SUPER";
      bind = [
        "$MOD, Q, exec, $terminal" 
        "$MOD. F, exec, $browser"
        "$MOD, N, exec, $notes"
        "$MOD, W, exec, $terminal nvim"
        "$MOD, Space, fullscreen,"
        "$MOD, Alt Space togglefloating,"
        "$MOD, Shift Space, togglesplit,"
        "$MOD, E, exec, $menu"
        "$MOD, R, exec, $cliFM"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, Shift H, movewindow, l"
        "$mainMod, Shift L, movewindow, r"
        "$mainMod, Shift J, movewindow, d"
        "$mainMod, Shift K, movewindow, u"
        "$mainMod ALT, H, resizeactive, 20 0"
        "$mainMod ALT, L, resizeactive, -20 0"
        "$mainMod ALT, J, resizeactive, 0 -20"
        "$mainMod ALT, K, resizeactive, 0 20"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%+"
        "$mainMod, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%-"
        "$mainMod SHIFT, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%"
        "$mainMod SHIFT, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"
      ];
      bindm = [
        "$MOD, mouse:272, movewindow"
        "$MOD, mouse:273, resizewindow"
      ];            
    };
  };
}