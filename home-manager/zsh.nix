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
      ngc = "sudo nix-collect-garbage --delete-old";
      g = "git";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
    };
    initExtra = ''
      PROMPT='$CYANλ $BLUE%~$YELLOW ''${vcs_info_msg_0_}$WHITE➜ '
      fastfetch
      export EDITOR='nvim'
      export TERMINAL='ghostty'
      export BROWSER='chromium'
      export TERM='kitty'
    '';
  };
}