{
  pkgs,
  ...
}:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu;
      runAsRoot = false;
    };
  };

  users.extraGroups.libvirtd.members = [ "sai" ];

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
  users.extraGroups.docker.members = [ "sai" ];
}
