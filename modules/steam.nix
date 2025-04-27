{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  users.extraGroups.steam.members = [ "sai" ];

  environment.systemPackages = with pkgs; [
    steam
    steam-run
  ];
}
