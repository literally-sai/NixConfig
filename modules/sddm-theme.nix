{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "9";
      background = ../resources/wallpaper.jpeg;
      loginBackground = true;
    })
  ];
}
