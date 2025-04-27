{ config, ... }:

{
  swww = {
    enable = true;
    wallpaper = "${config.home.homeDirectory}/.flake/resources/wallpaper.jpeg";
  };
}
