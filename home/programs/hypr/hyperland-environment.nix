{ config, pkgs, ...}:
{
  home = {
    sessionVariables = {
      XCURSOR_SIZE = "24";
      HYPRCURSOR_SIZE = "24";
    };
  };
}
