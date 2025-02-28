{ config, pkgs, nixvim, ...}: 
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
}
