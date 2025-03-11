{
  config,
  ...
}:
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
      nrb = "sudo nixos-rebuild switch --flake /home/sai/.home#Ghylak";
      nfu = "nix flake update --flake /home/sai/.home#Ghylak";
      ngc = "sudo nix-collect-garbage --delete-old";
      g = "git";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
    };
    initExtra = ''
      PROMPT='%F{blue}λ %1~%f%F{white} |%  '
      fastfetch
      export EDITOR='nvim'
      export TERMINAL='ghostty'
      export BROWSER='chromium'
      export TERM='ghostty'
    '';
  };
}