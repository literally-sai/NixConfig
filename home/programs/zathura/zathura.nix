{ config, pkgs, ... }:
{
  programs = {
    zathura = {
      enable = true;
    };
  };

  home.file."zathurarc".text = ''
  set default-bg "#121113"
  set default-fg "#FF0000"

  map <C-=> zoom in
  map <C-+> zoom in
  map <C--> zoom out
  map <C-_> zoom out

  set adjust-open "best-fit"
  set scroll-step 100
  set zoom-min 10
  set recolor "true"
  set recolor-lightcolor "#121114"
  set recolor-darkcolor "#CDD6F4"
  set guioptions c
  '';
}
