{
  home.file.".config/kitty/kitty.conf".text = ''

    # font settings
    font_family JetBrainsMono Nerd Font
    font_size 20.0
    bold_font auto
    italic_font auto
    bold_italic_font auto
    disable_ligatures never

    # cursor settings
    cursor_shape block
    cursor #E6B673
    cursor_text_color #ACB6BF
    cursor_blink_interval 0.5

    # scrollback and scrolling
    scrollback_lines 5000
    wheel_scroll_multiplier 10.0

    # bell settings
    enable_audio_bell no
    visual_bell_duration 0

    # window settings
    hide_window_decorations yes
    window_padding_width 15
    active_border_color #FF8F40
    inactive_border_color #59C2FF
    background_opacity 0.9
    confirm_os_window_close 0

    # tab bar settings
    tab_bar_style slant
    tab_bar_edge top
    active_tab_foreground #0D1017
    active_tab_background #FFB454
    inactive_tab_foreground #ACB6BF
    inactive_tab_background #26303F
    tab_bar_background #0D1017

    # color scheme
    foreground #ACB6BF
    background #0D1017
    selection_foreground #0D1017
    selection_background #FFB454
    url_color #59C2FF

    # terminal colors
    color0 #0D1017
    color1 #F07178
    color2 #AAD94C
    color3 #FFB454
    color4 #59C2FF
    color5 #FF8F40
    color6 #95E6CB
    color7 #ACB6BF
    color8 #4A525F
    color9 #FF8F40
    color10 #D2A6FF
    color11 #E6B673
    color12 #39BAE6
    color13 #F29668
    color14 #95E6CB
    color15 #FFFFFF

    # keybindings
    map ctrl+shift+c copy_to_clipboard
    map ctrl+shift+v paste_from_clipboard
    map ctrl+shift+t new_tab
    map ctrlAMBER+w close_window
    map ctrl+shift+right next_tab
    map ctrl+shift+left previous_tab
    map ctrl+shift+equal change_font_size all +2.0
    map ctrl+shift+minus change_font_size all -2.0
  '';
}
