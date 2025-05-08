{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {

    base16Scheme = {
      base00 = "1d1a2f"; # Background
      base01 = "2a2740"; # Lighter background
      base02 = "3f3a5c"; # Selection background
      base03 = "5a5578"; # Comments
      base04 = "8bd450"; # Foreground (text)
      base05 = "b0e975"; # Light foreground
      base06 = "d4f099"; # Lightest foreground
      base07 = "f0f7c3"; # Bright white
      base08 = "ff5555"; # Red
      base09 = "ffaa55"; # Orange
      base0A = "f7e05a"; # Yellow
      base0B = "8bd450"; # Green
      base0C = "50c4d4"; # Cyan
      base0D = "965fd4"; # Blue
      base0E = "c350c3"; # Magenta
      base0F = "aa55ff"; # Purple
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        desktop = 10;
        applications = 12;
        terminal = 11;
        popups = 10;
      };
    };

    cursor = {
      name = "capitaine-cursors-white";
      package = pkgs.capitaine-cursors;
      size = 12;
    };

    polarity = "dark";
  };
}
