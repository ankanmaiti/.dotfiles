{ config, lib, pkgs, pkgs-unstable, ... }:

{
  programs.waybar = {
    enable 	= true;
    package 	= pkgs.waybar;
  };

  # config
  programs.waybar.settings.mainBar = {
    layer	= "bottom";
    position	= "bottom";
    height	= 10;
    output	= [ "eDP-1" "HDMI-A-1" ];

    # modules position
    modules-left = [ "sway/workspaces" "sway/mode" "wlr/tskbar" ];
    modules-center = [ "sway/window" ];
    modules-right = [ "memory" "cpu" "network" "battery" ];

    # modules settings
  };

  # # style (css)
  # programs.waybar.style = ''
  # * {
  #   border: none;
  #   border-radius: 0;
  # }
  # window#waybar {
  #   background: transparent;
  #   color: white;
  # }
  # '';
}
