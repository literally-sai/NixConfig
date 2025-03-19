{
  pkgs,
  config,
  ...
}:
let
  dir = "${config.home.homeDirectory}";
in
{
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "run,ssh,drun";
      display-drun = " ";
      icon-theme = "Papirus";
      show-icons = true;
    };
    package = pkgs."rofi-wayland";

    theme = "${dir}/home-manager/theme.rasi";
  };
  home.file.".config/rofi/theme.rasi".text = ''
      * {
      black:      #000000;
      red:        #eb6e67;
      green:      #95ee8f;
      yellow:     #f8c456;
      blue:       #6eaafb;
      mangenta:   #d886f3;
      cyan:       #6cdcf7;
      emphasis:   #f8c456;
      text:       #dfdfdf;
      text-alt:   #b2b2b2;
      fg:         #abb2bf;
      bg:         #282c34;

      spacing: 0;
      background-color: transparent;

      font: "JetBrains Mono Nerd Font 14";
      text-color: @text;
    }

    window {
      transparency: "real";
      fullscreen: true;
      background-color: rgba(40, 44, 52, 0.75); /* Slightly darker than original for contrast */
    }

    mainbox {
      padding: 30% 30%;
    }

    inputbar {
      margin: 0px 0px 20px 0px;
      children: [prompt, textbox-prompt-colon, entry, case-indicator];
    }

    prompt {
      text-color: @yellow;
    }

    textbox-prompt-colon {
      expand: false;
      str: ":";
      text-color: @text-alt;
    }

    entry {
      margin: 0px 10px;
    }

    listview {
      spacing: 3px;
      columns: 1;
      lines: 5;
      scrollbar: false;
    }

    element {
      padding: 5px;
      text-color: @text-alt;
      highlight: bold @yellow;
      border-radius: 3px;
    }

    element selected {
      background-color: @emphasis;
      text-color: @text;
    }

    element urgent, element selected urgent {
      text-color: @red;
    }

    element active, element selected active {
      text-color: @red;
    }

    message {
      padding: 5px;
      border-radius: 3px;
      background-color: @emphasis;
      border: 1px;
      border-color: @cyan;
    }

    button selected {
      padding: 5px;
      border-radius: 3px;
      background-color: @emphasis;
    }
  '';
}