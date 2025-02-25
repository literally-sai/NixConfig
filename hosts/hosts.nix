{ config, lib, pkgs, ...}:
{
  imports = [
    ./fonts/fonts.nix
    ./virtualization/virtualization.nix
  ];
}
