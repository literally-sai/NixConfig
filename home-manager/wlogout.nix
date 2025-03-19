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
    ];
    style = ''
      window {
        font-family: JetBrains Mono Nerd Font;
        font-size: 14pt;
        color: #ffffff; /* text */
        background-color: rgba(46, 52, 64, 0.8);
      }

      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border: none;
        background-color: rgba(30, 30, 46, 0);
        margin: 5px;
        color: #ffffff;
        transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
        background-color: rgba(76, 85, 106, 0.4);
      }

      button:focus {
        background-color: #4c566a;
        color: #ffffff;
      }

      #lock {
        background-image: image(url("${image_dir}/lock.png"));
      }
      #lock:focus {
        background-image: image(url("${image_dir}/lock-hover.png"));
      }

      #logout {
        background-image: image(url("${image_dir}/logout.png"));
      }
      #logout:focus {
        background-image: image(url("${image_dir}/logout-hover.png"));
      }

      #suspend {
        background-image: image(url("${image_dir}/sleep.png"));
      }
      #suspend:focus {
        background-image: image(url("${image_dir}/sleep-hover.png"));
      }

      #shutdown {
        background-image: image(url("${image_dir}/power.png"));
      }
      #shutdown:focus {
        background-image: image(url("${image_dir}/power-hover.png"));
      }

      #reboot {
        background-image: image(url("${image_dir}/restart.png"));
      }
      #reboot:focus {
        background-image: image(url("${image_dir}/restart-hover.png"));
      }
    '';
  };
}