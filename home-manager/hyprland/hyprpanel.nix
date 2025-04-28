{
  inputs,
  ...
}:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];
  programs.hyprpanel = {
    enable = true;
    hyprland.enable = true;
    overlay.enable = true;
    overwrite.enable = true;
  };
}
