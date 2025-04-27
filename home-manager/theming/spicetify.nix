{
  pkgs,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.starryNight;
    colorScheme = "forest";
    spicetifyPackage = pkgs.spicetify-cli;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
      fullAppDisplay
      playNext
      playlistIcons
      fullAlbumDate
      volumePercentage
      keyboardShortcut
      autoSkipExplicit
      bookmark
      autoSkipVideo
      beautifulLyrics
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      spicetifyMarketplace
    ];
  };
}
