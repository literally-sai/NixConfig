{ config, ... }:
let
  image_dir = "${config.home.homeDirectory}/.flake/resources";
in
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
    ];
    style = ''
      window {
        font-family: "Inter", "JetBrains Mono Nerd Font", sans-serif;
        font-size: 16px;
        font-weight: 500;
        color: #ffffff;
        background: url('${image_dir}/wallpaper.png');
        background-size: cover;
        background-position: center;
      }

      box {
        background-color: rgba(30, 30, 46, 0.7);
        border-radius: 16px;
        padding: 20px;
        margin: 50px;
        backdrop-filter: blur(12px);
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.3);
      }

      button {
        background-color: rgba(46, 52, 64, 0.9);
        border-radius: 12px;
        margin: 10px;
        padding: 15px 20px;
        color: #ffffff;
        font-size: 14px;
        font-weight: 600;
        transition: all 0.3s ease;
        border: 1px solid rgba(255, 255, 255, 0.1);
      }

      button:hover {
        background-color: rgba(80, 80, 100, 0.9);
        transform: scale(1.05);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      }

      button:focus, button:active {
        background-color: rgba(100, 100, 120, 0.9);
        outline: none;
      }

      #lock {
        background-image: image(url("${image_dir}/lock.png"));
        background-size: 24px;
        background-position: left 15px center;
        background-repeat: no-repeat;
        padding-left: 50px;
        text-align: left;
      }
      #lock:focus {
        background-image: image(url("${image_dir}/lock-hover.png"));
      }

      #logout {
        background-image: image(url("${image_dir}/logout.png"));
        background-size: 24px;
        background-position: left 15px center;
        background-repeat: no-repeat;
        padding-left: 50px;
        text-align: left;
      }
      #logout:focus {
        background-image: image(url("${image_dir}/logout-hover.png"));
      }

      #suspend {
        background-image: image(url("${image_dir}/suspend.png"));
        background-size: 24px;
        background-position: left 15px center;
        background-repeat: no-repeat;
        padding-left: 50px;
        text-align: left;
      }
      #suspend:focus {
        background-image: image(url("${image_dir}/suspend-hover.png"));
      }

      #hibernate {
        background-image: image(url("${image_dir}/hibernate.png"));
        background-size: 24px;
        background-position: left 15px center;
        background-repeat: no-repeat;
        padding-left: 50px;
        text-align: left;
      }
      #hibernate:focus {
        background-image: image(url("${image_dir}/hibernate-hover.png"));
      }

      #reboot {
        background-image: image(url("${image_dir}/reboot.png"));
        background-size: 24px;
        background-position: left 15px center;
        background-repeat: no-repeat;
        padding-left: 50px;
        text-align: left;
      }
      #reboot:focus {
        background-image: image(url("${image_dir}/reboot-hover.png"));
      }

      #shutdown {
        background-image: image(url("${image_dir}/shutdown.png"));
        background-size: 24px;
        background-position: left 15px center;
        background-repeat: no-repeat;
        padding-left: 50px;
        text-align: left;
      }
      #shutdown:focus {
        background-image: image(url("${image_dir}/shutdown-hover.png"));
      }
    '';
  };
}
