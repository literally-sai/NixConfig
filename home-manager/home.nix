{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
    inputs.stylix.homeManagerModules.stylix
    inputs.nixvim.homeManagerModules.nixvim
    ./Hyprland/hypridle.nix
    ./Hyprland/hyprland.nix
    ./Hyprland/hyprlock.nix
    ./Hyprland/hyprpanel.nix
    ./Hyprland/hyprpaper.nix
    ./Hyprland/hyprshade.nix
    ./Hyprland/pypr.nix
    ./Nixvim/nixvim.nix
    ./ghostty.nix
    ./kitty.nix
    ./fastfetch.nix
    ./rofi.nix
    ./wlogout.nix
    ./fzf.nix
    ./zsh.nix
    ./spicetify.nix
    ./stylix.nix
    ./git.nix
  ];
  home.stateVersion = "24.11";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    overlays = [
      inputs.rust-overlay.overlays.default
    ];
  };

  home = {
    username = "sai";
    homeDirectory = "/home/sai";
    packages = with pkgs; [
      bat
      bitwarden-desktop
      black
      brave
      ente-auth
      eza
      file-roller
      firefox
      gcc
      hclfmt
      hyprshade
      lexend
      material-design-icons
      markdownlint-cli
      fastfetch
      nerd-fonts.fira-code
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nixfmt-rfc-style
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      obsidian
      pamixer
      pavucontrol
      playerctl
      prettierd
      protonmail-desktop
      pulsemixer
      pyprland
      rclone
      roboto
      rubik
      rust-bin.nightly.latest.default
      vscode
      tree
      discord
      zathura
      shfmt
      stylua
      wl-clipboard
      ungoogled-chromium
      unzip
      webcord-vencord
      yamlfmt
      yazi
      zip
      papirus-icon-theme
    ];
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}