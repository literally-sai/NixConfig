{ config, pkgs, ...}:
{
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "refined";
        plugins = [
          "git"
        ];
      };
      enableAutosuggestions= true;
      enableCompletion = true;
      enableSyntaxHighlighting= true;
    };
  };

  home.file.".zshrc".text = ''
  export PATH="$HOME/bin:/usr/local/bin:$PATH"
  export ZSH="$HOME/oh-my-zsh"

  ZSH_THEME="refined"
  REFINED_CHAR_SYMBOL="λ"

  export PATH="$HOME/.config/rofi/scripts:$PATH"
  '';
}
