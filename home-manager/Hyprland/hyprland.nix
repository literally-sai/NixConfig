{ inputs, config, ... }:
{
  # Define the hyprland.conf file
  home.file.".config/hypr/hyprland.conf".text = ''
    # Variables
    $terminal = kitty
    $fileManager = nautilus
    $menu = rofi -show drun
    $cliFM = $terminal -e yazi
    $MOD = SUPER

    # Autostart programs
    exec-once = hyprpaper &
    exec-once = pypr &
    exec-once = hyprshade on vibrance
    exec-once = solaar
    exec-once = hypridle &

    # Monitor setup
    monitor=,preferred,auto,auto

    # General settings
    general {
        gaps_in = 2
        gaps_out = 10
        border_size = 2
        resize_on_border = false
        allow_tearing = false
        layout = dwindle
    }

    # Decoration
    decoration {
        rounding = 10
        active_opacity = 1.0
        inactive_opacity = 1.0
        blur {
            enabled = true
            size = 3
            passes = 1
            vibrancy = 0.1695
        }
    }

    # Animations
    animations {
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 7, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 7, default
    }

    # Dwindle layout
    dwindle {
        pseudotile = true
        preserve_split = true
    }

    # Input settings
    input {
        kb_layout = us
        mouse_refocus = 0
        accel_profile = flat
        follow_mouse = 1
        sensitivity = -0.5
        touchpad {
            natural_scroll = false
        }
    }

    # Key bindings
    bind = $MOD, Q, exec, $terminal
    bind = $MOD, C, killactive
    bind = $MOD, W, exec, $terminal nvim
    bind = $MOD, Space, fullscreen
    bind = $MOD, Alt Space, togglefloating
    bind = $MOD, Shift Space, togglesplit
    bind = $MOD, E, exec, $menu
    bind = $MOD, R, exec, $cliFM
    bind = $MOD Alt, L, exec, hyprlock
    bind = $MOD, H, movefocus, l
    bind = $MOD, L, movefocus, r
    bind = $MOD, J, movefocus, d
    bind = $MOD, K, movefocus, u
    bind = $MOD Shift, H, movewindow, l
    bind = $MOD Shift, L, movewindow, r
    bind = $MOD Shift, J, movewindow, d
    bind = $MOD Shift, K, movewindow, u
    bind = $MOD ALT, H, resizeactive, 20 0
    bind = $MOD ALT, L, resizeactive, -20 0
    bind = $MOD ALT, J, resizeactive, 0 -20
    bind = $MOD ALT, K, resizeactive, 0 20
    bind = $MOD, 1, workspace, 1
    bind = $MOD, 2, workspace, 2
    bind = $MOD, 3, workspace, 3
    bind = $MOD, 4, workspace, 4
    bind = $MOD, 5, workspace, 5
    bind = $MOD, 6, workspace, 6
    bind = $MOD, 7, workspace, 7
    bind = $MOD, 8, workspace, 8
    bind = $MOD, 9, workspace, 9
    bind = $MOD, 0, workspace, 10
    bind = $MOD SHIFT, 1, movetoworkspace, 1
    bind = $MOD SHIFT, 2, movetoworkspace, 2
    bind = $MOD SHIFT, 3, movetoworkspace, 3
    bind = $MOD SHIFT, 4, movetoworkspace, 4
    bind = $MOD SHIFT, 5, movetoworkspace, 5
    bind = $MOD SHIFT, 6, movetoworkspace, 6
    bind = $MOD SHIFT, 7, movetoworkspace, 7
    bind = $MOD SHIFT, 8, movetoworkspace, 8
    bind = $MOD SHIFT, 9, movetoworkspace, 9
    bind = $MOD SHIFT, 0, movetoworkspace, 10
    bind = $MOD, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%+
    bind = $MOD, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%-
    bind = $MOD SHIFT, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%
    bind = $MOD SHIFT, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%

    # Mouse bindings
    bindm = $MOD, mouse:272, movewindow
    bindm = $MOD, mouse:273, resizewindow
  '';
}
