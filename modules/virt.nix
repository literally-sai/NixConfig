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
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
  users.extraGroups.docker.members = ["sai"];
}