{ config, lib, pkgs, ...}:
{
  fonts = {
    packages = with pkgs; [
      hermit
      mononoki
      noto-fonts
      noto-fonts-emoji
      fira-code
      fira-code-symbols
    ];
    fontconfig = {
      localConf = ''
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
      <fontconfig>
        <!-- Default monospace fonts -->
        <match target="pattern">
          <test name="family">
            <string>monospace</string>
          </test>
          <edit name="family" mode="prepend" binding="strong">
            <string>Hermit Nerd Font</string>
        <!-- Primary -->
            <string>mononoki</string>
        <!-- Secondary -->
          </edit>
        </match>
      </fontconfig>
      '';
    };
  };
}
