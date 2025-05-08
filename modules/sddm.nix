{ pkgs, ... }:

{
  services.displayManager = {
    defaultSession = "hyprland";
    autoLogin = {
      enable = true;
      user = "sai";
    };
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "cattppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "9";
      loginBackground = false; # Disable heavy background
    })
  ];
}
