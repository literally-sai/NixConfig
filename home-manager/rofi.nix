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

    theme = "${dir}/.config/rofi/theme.rasi";
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
    text-color: #dfdfdf; /* Replacing @text with the value */
  }
  
  window {
    transparency: "real";
    fullscreen: true;
    background-color: rgba(40, 44, 52, 0.75);
  }
  
  mainbox {
    padding: 30% 30%;
  }
  
  inputbar {
    margin: 0px 0px 20px 0px;
    children: [prompt, textbox-prompt-colon, entry, case-indicator];
  }
  
  prompt {
    text-color: #f8c456; /* Replacing @yellow with the value */
  }
  
  textbox-prompt-colon {
    expand: false;
    str: ":";
    text-color: #b2b2b2; /* Replacing @text-alt with the value */
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
    text-color: #b2b2b2; /* Replacing @text-alt with the value */
    highlight: bold #f8c456; /* Replacing @yellow with the value */
    border-radius: 3px;
  }
  
  element selected {
    background-color: #f8c456; /* Replacing @emphasis with the value */
    text-color: #dfdfdf; /* Replacing @text with the value */
  }
  
  element urgent, element selected urgent {
    text-color: #eb6e67; /* Replacing @red with the value */
  }
  
  element active, element selected active {
    text-color: #eb6e67; /* Replacing @red with the value */
  }
  
  message {
    padding: 5px;
    border-radius: 3px;
    background-color: #f8c456; /* Replacing @emphasis with the value */
    border: 1px;
    border-color: #6cdcf7; /* Replacing @cyan with the value */
  }
  
  button selected {
    padding: 5px;
    border-radius: 3px;
    background-color: #f8c456; /* Replacing @emphasis with the value */
  }
  
  '';
}

