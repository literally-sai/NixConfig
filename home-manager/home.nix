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
    ./nixvim.nix
    ./ghostty.nix
    ./kitty.nix
    ./fastfetch.nix
    ./rofi.nix
    ./fzf.nix
    ./zsh.nix
    ./spicetify.nix
    ./stylix.nix
    ./wlogout.nix
  ];

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
      ente-auth
      hyprpaper
      eza
      file-roller
      firefox
      gcc
      hclfmt
      hyprshade
      lexend
      material-design-icons
      markdownlint-cli
      nodejs_23
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
      kitty
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
      unzip
      webcord-vencord
      yamlfmt
      yazi
      zip
      papirus-icon-theme
    ];
  };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userEmail = "173792483+literally-sai@users.noreply.github.com";
      userName = "literally-sai";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
