{
  pkgs,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify.homeManagerModules.default ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.starryNight;
    colorScheme = "Cotton-candy";
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
  };
}
