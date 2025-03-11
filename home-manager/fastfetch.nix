{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "none";
        padding = { right = 3; };
      };
      display = {
        binaryPrefix = "si";
        color = "blue";
        separator = " λ ";
      };
      modules = [
        {
          key = "Host        ";
          type = "host";
        }
        {
          key = "Distro      ";
          type = "os";
        }
        {
          key = "Kernel      ";
          type = "kernel";
        }
        {
          key = "WM          ";
          type = "wm";
        }

        {
          key = "Terminal    ";
          type = "terminal";
        }
        {
          key = "Shell       ";
          type = "shell";
        }
        {
          key = "Packages    ";
          type = "packages";
        }
        "break"
        {
          key = "CPU         ";
          type = "cpu";
          temp = true;
        }
        {
          key = "GPU         ";
          type = "gpu";
          temp = true;
        }
        {
          key = "Memory      ";
          type = "memory";
        }
        "break"
        {
          type = "colors";
          paddingLeft = 3;
          symbol = "circle";
        }
      ];
    };
  };
}