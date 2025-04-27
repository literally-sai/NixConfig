{ config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };
      background = {
        monitor = "";
        path = "${config.home.homeDirectory}/.flake/resources/hyprlock.png";
        color = "rgba(25, 20, 20, 1.0)";
      };
      input-field = {
        monitor = "";
        size = "200, 50";
        outline_thickness = 3;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = true;
        outer_color = "rgb(151515)";
        inner_color = "rgb(200, 200, 200)";
        font_color = "rgb(10, 10, 10)";
        fade_on_empty = true;
        placeholder_text = "<i>Password...</i>";
        hide_input = false;
        position = "0, -20";
        halign = "center";
        valign = "center";
      };
      label = {
        monitor = "";
        text = "cmd[update:1000] date '+%H:%M'";
        color = "rgba(200, 200, 200, 1.0)";
        font_size = 50;
        font_family = "JetBrainsMono Nerd Font Mono";
        position = "0, 80";
        halign = "center";
        valign = "center";
      };
    };
  };
}
