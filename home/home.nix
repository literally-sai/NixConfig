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
      neovim
      vscode
      obsidian
      ranger

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
      tree
      unzip
      wl-clipboard
      gnumake
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
