{
  pkgs,
  config,
  ...
}: {
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["sai"];

  environment.systemPackages = with pkgs; [
    qemu
    quickemu
    spice-gtk
    virt-manager
    docker-compose
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  users.extraGroups.docker.members = ["sai"];
}