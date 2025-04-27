{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland
    ./editors
    ./shell
    ./theming
    inputs.spicetify.homeManagerModules.default
    inputs.stylix.homeManagerModules.stylix
    inputs.nixvim.homeManagerModules.nixvim
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    overlays = [
      inputs.rust-overlay.overlays.default
    ] ++ (lib.optionals config.stylix.overlays.enable [ inputs.stylix.overlays.default ]);
  };

  home = {
    username = "sai";
    homeDirectory = "/home/sai";
    stateVersion = "24.11";
    packages = with pkgs; [
      # cli
      bat
      eza
      tree
      unzip
      zip
      yazi
      fastfetch

      # dev
      gcc
      go
      nodejs_23
      rust-bin.nightly.latest.default
      golangci-lint
      black
      hclfmt
      markdownlint-cli
      nixfmt-rfc-style
      prettierd
      shfmt
      stylua
      yamlfmt
      premake5

      # editors
      vscode
      obsidian
      zathura

      # web
      firefox

      # com
      discord
      webcord-vencord

      # files
      file-roller
      nautilus
      ranger

      # media
      obs-studio
      blender
      pamixer
      pavucontrol
      playerctl
      pulsemixer
      wireplumber

      # terminal
      kitty
      ghostty
      tmux

      # hypr
      hyprland
      hyprpanel
      hypridle
      hyprlock
      swww

      # fonts
      lexend
      roboto
      rubik
      material-design-icons
      nerd-fonts.fira-code
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      papirus-icon-theme

      # sys utils
      openssl
      openvpn
      git
      bluez
      bluez-utils
      networkmanager
      dart-sass
      gvfs
      libgtop
      upower
      usbutils
      wl-clipboard
      aylurs-gtk-shell-git
      slurp
      grim
    ];
  };
}
