{
  config,
  pkgs,
  ...
}:
let
  dir = "${config.home.homeDirectory}";
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      ls = "eza --icons";

      nsc = "nvim ${dir}/nixos/ghylak/configuration.nix";
      nrs = "sudo nixos-rebuild switch --flake '${dir}/.home/'";
      hsc = "nvim ${dir}/home-manager/home.nix";
      fsc = "nvim ${dir}/.home/flake.nix";
      nhl = "nvim ${dir}/home-manager/Hyprland/hyprland.nix";
      nhp = "nvim ${dir}/home-manager/Hyprland/hyprpanel.nix";
      nfu = "nix flake update --flake ${dir}/.home/";
      ngc = "sudo nix-collect-garbage --delete-old";

      g = "git";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
    };
    initExtra = ''
      PROMPT='%F{yellow}  %1~%f %F{green}>%f '
      fastfetch
      export EDITOR='nvim'
      export TERMINAL='${pkgs.kitty}/bin/kitty'
      export BROWSER='${pkgs.firefox}/bin/firefox'
      export TERM='kitty'
    '';
  };
}