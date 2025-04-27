{
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        # header
        "title"
        "separator"

        # sys info
        "os"
        "host"
        "kernel"
        "packages"

        # de
        "de"
        "wm"

        # shell
        "shell"
        "terminal"

        # god parts
        "display"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
      ];
    };
  };
}
