{ pkgs, ... }:
{
  home.file.".config/ghostty/config".text = ''
    font-family = JetBrainsMono Nerd Font Mono
    font-size = 15

    background = 1d1a2f
    foreground = 8bd450

    selection-foreground = 1d1a2f
    selection-background = 965fd4

    palette = 0=1d1a2f 
    palette = 1=a14e6a 
    palette = 2=3f6d4e 
    palette = 3=d47e4e 
    palette = 4=965fd4 
    palette = 5=b14ea1 
    palette = 6=3f6d4e 
    palette = 7=c7c1e0 
    palette = 8=734f9a 
    palette = 9=a14e6a 
    palette = 10=8bd450
    palette = 11=e0b14e
    palette = 12=965fd4
    palette = 13=b14ea1
    palette = 14=3f6d4e
    palette = 15=f5f4f9
  '';
}