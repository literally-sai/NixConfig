{
  pkgs,
  ...
}:
{
  home.file.".config/hypr/pyprland.json".text = ''
    {
      "pyprland": {
        "plugins": ["scratchpads", "magnify"]
      },
      "scratchpads": {
        "term": {
          "command": "${pkgs.kitty}/bin/kitty --class=scratchpad.foo",
          "margin": 50,
          "animation": "fromTop"
        },
        "ranger": {
          "command": "${pkgs.kitty}/bin/kitty --class=scratchpad.foo -e ${pkgs.yazi}/bin/yazi",
          "margin": 50,
          "animation": "fromTop"
        },
        "volume": {
          "command": "${pkgs.kitty}/bin/kitty --class=scratchpad.foo -e ${pkgs.pulsemixer}/bin/pulsemixer",
          "margin": 50,
          "animation": "fromTop"
        }
      }
    }
  '';
}