{ config, ... }:

{
  swww = {
    enable = true;
    wallpaper = "${config.home.homeDirectory}/.flake/resources/background.png";
  };
}
