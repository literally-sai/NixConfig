{
  config,
  pkgs,
  ...
}:
let
  wallpapers_dir = "${config.home.homeDirectory}/.flake/resources";
in
{
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      splash = false;
      preload = [ "${wallpapers_dir}/background.png" ];
      wallpaper = [ ",${wallpapers_dir}/background.png" ];
    };
  };
}