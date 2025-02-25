{ config, pkgs, ...}:
{
  imports = [
    ./git/git.nix
    ./zsh/zsh.nix
    ./hyprland/hyprland.nix
    ./kitty/kitty.nix
    ./rofi/rofi.nix
    ./waybar/waybar.nix
  ];
}
