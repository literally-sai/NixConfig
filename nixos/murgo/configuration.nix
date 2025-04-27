{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "Murgo";
  system.stateVersion = "25.05";
}
