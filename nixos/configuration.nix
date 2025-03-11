{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  nixpkgs.config.allowUnfree = true;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        flake-registry = "";
        nix-path = config.nix.nixPath;
      };
      channel.enable = false;
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

    networking.hostName = "Ghylak";
    networking.networkmanager.enable = true;
    time.timeZone = "Europe/Berlin";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
    hardware = {
      graphics.enable = true;
    };
    services = {
      xserver.xkb = {
        layout = "us";
        variant = "";
      };
      pulseaudio.enable = false;
      gnome.gnome-keyring.enable = true;
      gvfs.enable = true;
      pipewire = {
        enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
      greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.hyprland}/bin/Hyprland";
            user = "sai";
          };
        };
      };
    };   

  users.users.sai = {
    isNormalUser = true;
    description = "Sai";
    shell = pkgs.zsh;
    extraGroups = [
        "networkmanager"
        "wheel"
    ];
  };

  programs = {
    zsh.enable = true;
    dconf.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
        sai = import ../home-manager/home.nix;
    };
  };

  system.stateVersion = "24.11";
}