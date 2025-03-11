{ config, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [ "/home/sai/.home/imgs/wallpaper.png" ];
      wallpaper = [ ",/home/sai/.home/imgs/wallpaper.png" ];
    };
  };
}
