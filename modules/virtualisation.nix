{
  pkgs,
  config,
  ...
}: {
  # VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["sai"]; # Your username

  # General Virtualization (QEMU, virt-manager, etc.)
  environment.systemPackages = with pkgs; [
    qemu
    quickemu
    spice-gtk
    virt-manager
  ];

  # Docker
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
  users.extraGroups.docker.members = ["sai"]; # Already in your config, but ensuring it's here
}