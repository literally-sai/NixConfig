{ hyprland, config, pkgs, pkgs-stable, ...}:
{
  imports = [
    ./programs/default.nix
  ];

  home = {
    username = "sai";
    homeDirectory = "/home/sai";
    stateVersion = "24.11";

    packages = (with pkgs; [
      # User Apps
      firefox
      kitty
      vscode
      obsidian
      ranger
      discord

      # Utils
      git
      fastfetch
      nodejs_23
      wlr-randr
      curl
      wget
      rustup
      btop
      iotop
      rofi
      grim
      slurp
      swww
      gcc
      tree
      zathura
      unzip
      wl-clipboard
      gnumake
      openssl
      premake5
      pavucontrol
    ]) ++ (with pkgs-stable; [
      sqlite
      postgresql
      bluez
    ]);
  };

  programs.home-manager.enable = true;
}
