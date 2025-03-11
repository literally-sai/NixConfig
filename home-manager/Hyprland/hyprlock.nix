{ lib, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = lib.mkForce {
      general = {
        disable_loading_bar = false;
        grace = 0; # Time (in seconds) before locking
        hide_cursor = true;
      };
      background = [
        {
          monitor = "";
          path = "screenshot"; # Use a screenshot as the background
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(0, 0, 0)";
          inner_color = "rgb(255, 255, 255)";
          font_color = "rgb(0, 0, 0)";
          fade_on_empty = false;
          placeholder_text = "<i>Enter Password...</i>";
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$TIME\"";
          font_size = 55;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 120";
          halign = "center";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
        {
          monitor = "";
          text = "$USER";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 20;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 80";
          halign = "center";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
      ];
    };
  };
}