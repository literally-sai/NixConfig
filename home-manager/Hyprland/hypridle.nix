{
  services.hypridle = {
    enable = false;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };
      listener = [
        {
          timeout = 180;
          on_timeout = "loginctl lock-session";
          on_resume = "dunstify 'Welcome Back!'";
        }
        {
          timeout = 270;
          on_timeout = "hyprctl dispatch dpms off";
          on_resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}