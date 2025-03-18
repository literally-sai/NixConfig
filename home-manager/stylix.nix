{ pkgs, config, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "1d1a2f";
      base01 = "734f9a";
      base02 = "3e375e";
      base03 = "5a4e7e";
      base04 = "8c7fb4";
      base05 = "c7c1e0";
      base06 = "e0dcee";
      base07 = "f5f4f9";
      base08 = "a14e6a";
      base09 = "d47e4e";
      base0A = "e0b14e";
      base0B = "8bd450";
      base0C = "3f6d4e";
      base0D = "965fd4";
      base0E = "b14ea1";
      base0F = "8c4e8c";
    };
    targets.gtk.enable = true;
    targets.rofi.enable = false;
    targets.nixvim.enable = false;
    targets.hyprlock.enable = false;
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
