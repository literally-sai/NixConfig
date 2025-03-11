{ pkgs, config, ... }:
let
  stylixImage = pkgs.runCommand "stylix-image" {} ''
    mkdir -p $out
    cp ${../imgs/stylix.png} $out/stylix.png
  '';
in
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    image = "${stylixImage}/stylix.png"; # Use the image from the Nix store
    targets.gtk.enable = true;
    targets.rofi.enable = false;
    targets.nixvim.enable = false;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
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