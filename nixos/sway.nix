{ config, lib, pkgs, pkgs-unstable, ... }:
let
  sway 		= config.wayland.windowManager.sway;
  modifier 	= config.wayland.windowManager.sway.config.modifier;
in
{
  wayland.windowManager.sway = {
    enable		= true;
    package		= pkgs.sway;
    xwayland		= true;
    checkConfig		= true;
  };
      
  wayland.windowManager.sway.config = {
    modifier 		= "Mod4"; # Super
    terminal 		= "kitty";
    menu		= "bemenu-run";
    bars		= [ { command = "waybar"; } ];
    bindkeysToCode	= true;

    # window gaps
    gaps.inner		= 10;
    gaps.outer		= 5;

  };

  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault{
    # "${modifier}+Shift+r" = "swaymsg reload";
    "${modifier}+Shift+t" = "input type:touchpad events toggle enabled disabled";
  };

  # bmenu setup ( dmenu alternate )
  programs.bemenu = {
    enable 		= true;
    package		= pkgs.bemenu; 
  };

  programs.bemenu.settings = {
    line-height		= 28; 
    prompt		= "open";
    ignorecase		= true;
    width-factor	= 0.5;
  };
}
