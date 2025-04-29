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

      ngc = "sudo nix-collect-garbage --delete-old";
      search = "nix search nixpkgs";

      g = "git";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
    };
    initContent = ''
      PROMPT='%F{yellow}  %1~%f %F{green}>%f '
      export EDITOR='nvim'
      export TERMINAL='${pkgs.kitty}/bin/kitty'
      export BROWSER='${pkgs.firefox}/bin/firefox'
      export TERM='kitty'
    '';
  };
}
