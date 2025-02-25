{ config, lib, pkgs, ...}:
{
  imports = [
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [
    waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
    monitor=,preferred,auto,auto

    $terminal = kitty
    $menu = wofi
    $notes = obsidian
    $code = nvim
    $browser = firefox
    $file_manager = ranger
    
    exec-once = waybar
    exec-once = swww init & sleep 0.5 && waybar

    general {
      gaps_in = 2
      gaps_out = 10

      border_size = 2

      col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
      col.inactive_border = rgba(595959aa)

      resize_on_border = false

      allow_tearing = false

      layout = dwindle
    }


    decoration {
      rounding = 10

      active_opacity = 1.0
      inactive_opacity = 1.0

      shadow {
        enabled = true
        range = 4
        render_power = 3
        color = rgba(1a1a1aee)
      }

      blur {
        enabled = true
        size = 3
        passes = 1

        vibrancy = 0.1696
      }
    }

    animations {
      enabled = yes, please :)

      bezier = easeOutQuint,0.23,1,0.32,1
      bezier = easeInOutCubic,0.65,0.05,0.36,1
      bezier = linear,0,0,1,1
      bezier = almostLinear,0.5,0.5,0.75,1.0
      bezier = quick,0.15,0,0.1,1

      animation = global, 1, 10, default
      animation = border, 1, 5.39, easeOutQuint
      animation = windows, 1, 4.79, easeOutQuint
      animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
      animation = windowsOut, 1, 1.49, linear, popin 87%
      animation = fadeIn, 1, 1.73, almostLinear
      animation = fadeOut, 1, 1.46, almostLinear
      animation = fade, 1, 3.03, quick
      animation = layers, 1, 3.81, easeOutQuint
      animation = layersIn, 1, 4, easeOutQuint, fade
      animation = layersOut, 1, 1.5, linear, fade
      animation = fadeLayersIn, 1, 1.79, almostLinear
      animation = fadeLayersOut, 1, 1.39, almostLinear
      animation = workspaces, 1, 1.94, almostLinear, fade
      animation = workspacesIn, 1, 1.21, almostLinear, fade
      animation = workspacesOut, 1, 1.94, almostLinear, fade
    }

    dwindle {
      pseudotile = true
      preserve_split = true
    }

    master {
      new_status = master
    }

    misc {
      force_default_wallpaper = -1
      disable_hyprland_logo = false
    }

    input {
      kb_layout = us
      follow_mouse = 1

      sensitivity = 0

      touchpad {
        natural_scroll = false
      }
    }

    gestures {
      workspace_swipe = false
    }

    device {
      name = epic-mouse-v1
      sensitivity = -0.5
    }

    $mainMod = SUPER

    bind = $mainMod, Q, exec, $terminal
    bind = $mainMod, F, exec, $browser
    bind = $mainMod, N, exec, $notes
    bind = $mainMod, W, exec, $terminal, $code
    bind = $mainMod, E, exec, $menu --show drun
    bind = $mainMod, C, killactive,
    bind = $mainMod, E, exec, $file_manager 
    bind = $mainMod, M, exit,

    bind = $mainMod, S, exec, grim -g "$(slurp)" ~/.screenshots/img$(date +"%Y-%m-%d_%H-%M-%S").png
    bind = $mainMod, P, pseudo
    bind = $mainMod, B, togglesplit,
    bind = $mainMod, V, togglefloating,

    bind = $mainMod, H, movefocus, l
    bind = $mainMod, L, movefocus, r
    bind = $mainMod, J, movefocus, d
    bind = $mainMod, K, movefocus, u


    bind = $mainMod SHIFT, H, movewindow, l
    bind = $mainMod SHIFT, L, movewindow, r
    bind = $mainMod SHIFT, J, movewindow, d
    bind = $mainMod SHIFT, K, movewindow, u

    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    bind = $mainMod, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%+
    bind = $mainMod, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 20%-
    bind = $mainMod SHIFT, P, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 100% 
    bind = $mainMod SHIFT, O, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%
    '';
  };
}
