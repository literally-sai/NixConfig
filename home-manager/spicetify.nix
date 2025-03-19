{ pkgs, lib, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  elegantDarkTheme = pkgs.stdenv.mkDerivation {
    name = "ElegantDark";
    src = pkgs.lib.cleanSource ./.;
    installPhase = ''
      mkdir -p $out/Themes/ElegantDark
      cat > $out/Themes/ElegantDark/color.ini <<EOF
      [custom]
      main = 1a1a1a          # Deep charcoal for main background
      sidebar = 2a2a3a       # Midnight blue-gray for sidebar
      player = 1a1a1a        # Match main background for player
      card = 3a3a4a         # Slightly lighter gray for cards
      shadow = 0a0a0a        # Near-black for shadows
      selected = 6b4e9a      # Rich purple for selections
      text = e8e8e8         # Soft white for primary text
      subtext = 8a8a9a       # Muted silver for secondary text
      highlight = b89a4a     # Muted gold for highlights
      highlight-elevated = 6b4e9a  # Purple for elevated highlights
      button = b89a4a        # Gold for buttons
      button-active = 6b4e9a # Purple for active buttons
      button-disabled = 4a4a5a # Dim gray for disabled buttons
      tab-active = 3a3a4a    # Match card color for active tabs
      notification = b89a4a  # Gold for notifications
      notification-error = 9a4e4e # Muted red for errors
      misc = 1a1a1a         # Match main for miscellaneous
      progress-bar = 6b4e9a  # Purple for progress bar
      progress-bar-background = 3a3a4a # Gray for progress bar background
      EOF
      cat > $out/Themes/ElegantDark/user.css <<EOF
      :root {
          --spice-font: "JetBrainsMono Nerd Font Mono", monospace;
          --shadow-light: rgba(10, 10, 10, 0.3);
          --shadow-dark: rgba(10, 10, 10, 0.6);
      }

      .main-container {
          background-color: #1a1a1a !important;
          border: 1px solid #2a2a3a;
          box-shadow: inset 0 0 10px var(--shadow-light);
      }

      .side-panel {
          background-color: #2a2a3a !important;
          border-right: 1px solid #6b4e9a;
          box-shadow: 0 0 15px var(--shadow-dark);
      }

      button, .button {
          transition: all 0.3s ease;
          border-radius: 8px;
          background-color: #b89a4a !important;
          color: #1a1a1a !important;
      }
      button:hover, .button:hover {
          background-color: #6b4e9a !important;
          transform: translateY(-2px);
          box-shadow: 0 5px 15px var(--shadow-dark);
      }
      button:active, .button:active {
          transform: translateY(0);
          box-shadow: 0 2px 8px var(--shadow-dark);
      }

      .progress-bar-wrapper {
          background-color: #3a3a4a !important;
          border-radius: 10px;
      }
      .progress-bar {
          background-color: #6b4e9a !important;
          border-radius: 10px;
          box-shadow: 0 0 8px rgba(107, 78, 154, 0.5);
      }

      .highlight, .selected-row, .selected {
          background-color: #6b4e9a !important;
          color: #e8e8e8 !important;
          border-radius: 6px;
          transition: background-color 0.3s ease;
      }
      .highlight:hover, .selected-row:hover, .selected:hover {
          background-color: #7b5eba !important;
      }

      body, .main-type-canon, .main-type-mesto {
          color: #e8e8e8 !important;
          font-family: var(--spice-font) !important;
          text-shadow: 0 0 2px var(--shadow-light);
      }

      .active, .playing, .selected {
          box-shadow: 0 0 12px rgba(107, 78, 154, 0.7);
          border: 1px solid #6b4e9a;
      }

      .card, .playlist-card {
          background-color: #3a3a4a !important;
          border-radius: 10px;
          box-shadow: 0 4px 12px var(--shadow-dark);
          transition: transform 0.3s ease;
      }
      .card:hover, .playlist-card:hover {
          transform: translateY(-4px);
          box-shadow: 0 6px 18px var(--shadow-dark);
      }

      ::-webkit-scrollbar {
          width: 10px;
      }
      ::-webkit-scrollbar-track {
          background: #2a2a3a;
      }
      ::-webkit-scrollbar-thumb {
          background: #6b4e9a;
          border-radius: 5px;
      }
      ::-webkit-scrollbar-thumb:hover {
          background: #7b5eba;
      }
      EOF
    '';
  };
in
{
  programs.spicetify = {
    enable = true;
    theme = {
      name = "ElegantDark";
      src = elegantDarkTheme;
    };
    colorScheme = "custom";
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