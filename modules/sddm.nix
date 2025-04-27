{
  pkgs,
  ...
}:
let
  wallpaper_dir = "../resources";
in
{
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = [ pkgs.sddm-sugar-dark ];
      theme = "sugar-dark";
    };
  };

}
