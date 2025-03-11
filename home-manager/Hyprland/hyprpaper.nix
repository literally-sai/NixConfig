{ config, pkgs, ... }:
let
  wallpaperImage = pkgs.runCommand "wallpaper-image" {} ''
    mkdir -p $out
    cp ${../../imgs/wallpaper.png} $out/wallpaper.png
  '';
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [ "${wallpaperImage}/wallpaper.png" ]; # Use the image from the Nix store
    };
  };
}