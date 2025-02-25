{ config, pkgs, lib, ...}:
{
  imports = [
    ./hardware-configuration.nix
    ../hosts
  ];

}
