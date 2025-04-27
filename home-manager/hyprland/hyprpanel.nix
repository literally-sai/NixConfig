{
  inputs,
  config,
  pkgs,
  ...
}:
let
  dir = "${config.home.homeDirectory}/.flake/resources";
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    hyprland.enable = true;
  };
}
