{
  pkgs,
  config,
  ...
}:
let
  dir = "${config.home.homeDirectory}";
in
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = "${dir}/wallpapers/background.png";
    targets = {
      gtk.enable = true;
      rofi.enable = false;
      nixvim.enable = false;
      hyprlock.enable = false;
      spicetify.enable = false;
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 10;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
    };
    polarity = "dark";
  };
}