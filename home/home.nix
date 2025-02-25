{ hyprland, pkgs, pkgs-stable, ...}: {
  
  imports = [
    ./programs
    ./themes
  ];

  home = {
    username = "sai";
    homeDirectory = "/home/sai";
    stateVersion = "23.11";
  };

  home.packages = (with pkgs; [
    # User Apps
    firefox
    neovim
    vscode
    kitty

    # Utils
    git
    nodejs_23
    ranger
    wlr-randr
    rustup
    curl
    gnumake
    pavucontrol
    wget
    btop
    rofi
    wofi
    grim
    slurp
    wl-clipboard
    unzip
    tree
  ]) ++ (with pkgs-stable; [
    sqlite
    postgresql
  ]);

  programs.home-manager.enable = true;
}
