{ config, pkgs, user, ... }:
{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "sai" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
