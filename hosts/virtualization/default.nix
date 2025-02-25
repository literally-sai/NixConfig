{ config, pkgs, user, ...}:
{
  virtualisation = {
    docker.enable = true
  };

  users.group.docker.members = [ "sai" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
