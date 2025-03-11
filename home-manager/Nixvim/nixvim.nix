{
  programs.nixvim = {
    enable = true;
    nixpkgs.useGlobalPackages = false;
    defaultEditor = true;
    colorschemes = {
      nord.enable = true;
    };
    plugins = {
      web-devicons.enable = true;
      lz-n.enable = true;
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };
  };
}