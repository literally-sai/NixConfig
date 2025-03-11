{ lib, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = lib.mkForce {
      general = {
        disable_loading_bar = false;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;
      };
      background = [
        {
          monitor = "";
          color = "rgb(20, 10, 40)";
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "300, 80";
          outline_thickness = 3;
          dots_size = 0.25;
          dots_spacing = 0.3;
          dots_center = true;
          outer_color = "rgb(106, 0, 255)";
          inner_color = "rgb(20, 10, 40)";
          font_color = "rgb(0, 255, 0)";
          fade_on_empty = false;
          placeholder_text = "<i>Enter Neural Link...</i>";
          position = "0, -50";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
          shadow_size = 5;
        }
      ];
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$TIME\"";
          color = "rgb(255, 69, 0)";
          font_size = 70;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 150";
          halign = "center";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 12;
        }
        {
          monitor = "";
          text = "$USER";
          color = "rgb(106, 0, 255)";
          font_size = 25;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 100";
          halign = "center";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
        {
          monitor = "";
          text = "NERV LOCKDOWN PROTOCOL";
          color = "rgb(0, 255, 0)";
          font_size = 18;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, -150";
          halign = "center";
          valign = "center";
          shadow_passes = 3;
          shadow_size = 8;
        }
      ];
    };
  };
}