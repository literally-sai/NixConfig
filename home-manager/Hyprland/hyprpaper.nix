{
  config,
  pkgs,
  ...
}:
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    splash = false
    preload = /home/sai/.home/imgs/wallpaper.png
    wallpaper = ,/home/sai/.home/imgs/wallpaper.png
  '';
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
  };
}
