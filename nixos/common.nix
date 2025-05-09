{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./../modules
  ];

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  nixpkgs = {
    config = {
      allowunfree = true;
      allowUnfreePredicate =
        pkg:
        builtins.elem (pkgs.lib.getName pkg) [
          "steam"
          "steam-original"
          "steam-run"
          "steam-unwrapped"
        ];
    };
  };

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  time.timeZone = "Europe/Berlin";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  services = {
    pulseaudio.enable = false;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire = {
        "92-low-latency" = {
          "context.properties" = {
            "default.clock.rate" = 96000;
            "default.clock.quantum" = 512;
            "default.clock.min-quantum" = 512;
            "default.clock.max-quantum" = 512;
          };
        };
      };
    };
  };

  users.users = {
    sai = {
      isNormalUser = true;
      description = "sai";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    kdePackages.sddm
    git
    networkmanager
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    inputs.psilovim.packages.${pkgs.system}.default
  ];

  networking.networkmanager.enable = true;

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
    zsh.enable = true;
    dconf.enable = true;
  };

  security.rtkit.enable = true;
}
