{
  lib,
  ...
}:
{
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enableHidpi = true;
      enable = true;
      wayland.enable = true;
      sugarCandyNix = {
        enable = true;
        settings = {
          Background = lib.cleanSource ../resources/wallpaper.jpeg;
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          FormPosition = "left";
          HaveFormBackground = true;
          PartialBlur = true;
          ForceHideCompletePassword = true;
        };
      };
    };
  };

}
