{ pkgs, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  themeDir = pkgs.runCommand "spicetify-theme-evangelion" {} ''
    mkdir -p $out
    cat > $out/color.ini <<EOF
    [custom]
    main = 1d1a2f
    sidebar = 734f9a
    player = 1d1a2f
    card = 734f9a
    shadow = 1d1a2f
    selected = 965fd4
    text = 8bd450
    subtext = 734f9a
    highlight = 8bd450
    highlight-elevated = 965fd4
    button = 8bd450
    button-active = 965fd4
    button-disabled = 3f6d4e
    tab-active = 3f6d4e
    notification = 965fd4
    notification-error = a14e6a
    misc = 1d1a2f
    progress-bar = 965fd4
    progress-bar-background = 734f9a
    EOF
    cat > $out/user.css <<EOF
    :root {
        --spice-font: "JetBrainsMono Nerd Font Mono", monospace;
    }
    .main-container {
        background-color: #1d1a2f !important;
        border: 1px solid #734f9a;
    }
    .side-panel {
        background-color: #734f9a !important;
        border-right: 1px solid #965fd4;
    }
    button, .button {
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
    button:hover, .button:hover {
        background-color: #965fd4 !important;
        transform: scale(1.05);
    }
    .progress-bar-wrapper {
        background-color: #734f9a !important;
    }
    .progress-bar {
        background-color: #965fd4 !important;
    }
    .highlight, .selected-row, .selected {
        background-color: #965fd4 !important;
        color: #1d1a2f !important;
    }
    body, .main-type-canon, .main-type-mesto {
        color: #8bd450 !important;
        font-family: var(--spice-font) !important;
    }
    .active, .playing, .selected {
        box-shadow: 0 0 10px #965fd4;
    }
    EOF
  '';
in
{
  programs.spicetify = {
    enable = true;
    theme = lib.mkForce {
      name = "Evangelion";
      src = themeDir;
      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;
      args = [ "--color-scheme" "custom" ];
    };
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplayMod
      adblock
      hidePodcasts
      shuffle
      playNext
      playlistIcons
      fullAlbumDate
      volumePercentage
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
  };
}