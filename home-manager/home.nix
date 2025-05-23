{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland
    ./shell
    ./theming
    ./terminal
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
      ripgrep

      # dev
      inputs.psilovim.packages.${pkgs.system}.default
      gcc
      rustup
      go
      golangci-lint
      black
      gleam
      erlang
      hclfmt
      markdownlint-cli
      rusty-man
      nixfmt-rfc-style
      prettierd
      shfmt
      stylua
      yamlfmt
      premake5
      protobuf

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
      ghostty
      tmux
      kitty

      # hypr
      hyprland
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
      bluez-tools
      bluez-alsa
      networkmanager
      dart-sass
      gvfs
      libgtop
      upower
      usbutils
      wl-clipboard
      slurp
      grim

      # nix
      nix-prefetch
      home-manager
    ];
  };

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";
}
