{ config, pkgs, ... }:
{
  home.file.".config/fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "small",
        "padding": {
          "top": 2,
          "left": 2
        }
      },
      "display": {
        "separator": " ➜ ",
        "color": "cyan",
        "key": {
          "width": 20
        }
      },
      "modules": [
        {
          "type": "os",
          "key": "OS"
        },
        {
          "type": "kernel",
          "key": "Kernel"
        },
        {
          "type": "uptime",
          "key": "Uptime"
        },
        {
          "type": "packages",
          "key": "Packages"
        },
        {
          "type": "shell",
          "key": "Shell"
        },
        {
          "type": "wm",
          "key": "WM"
        },
        {
          "type": "cpu",
          "key": "CPU"
        },
        {
          "type": "gpu",
          "key": "GPU"
        },
        {
          "type": "memory",
          "key": "Memory"
        },
        {
          "type": "disk",
          "key": "Disk"
        }
      ]
    }
  '';
}