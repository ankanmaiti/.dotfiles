{ config, lib, pkgs, pkgs-unstable, ... }:
let
  modifier = config.xsession.windowManager.i3.config.modifier;
  col = {
    rosewater = "#f5e0dc";
    flamingo  = "#f2cdcd";
    pink      = "#f5c2e7";
    mauve     = "#cba6f7";
    red       = "#f38ba8";
    maroon    = "#eba0ac";
    peach     = "#fab387";
    yellow    = "#f9e2af";
    green     = "#a6e3a1";
    teal      = "#94e2d5";
    sky       = "#89dceb";
    sapphire  = "#74c7ec";
    blue      = "#89b4fa";
    lavender  = "#b4befe";
    text      = "#cdd6f4";
    subtext1  = "#bac2de";
    subtext0  = "#a6adc8";
    overlay2  = "#9399b2";
    overlay1  = "#7f849c";
    overlay0  = "#6c7086";
    surface2  = "#585b70";
    surface1  = "#45475a";
    surface0  = "#313244";
    base      = "#1e1e2e";
    mantle    = "#181825";
  };

in
{
  # i3 setup
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      window = {
        titlebar = false; 
	border = 2;
	hideEdgeBorders = "smart";
	commands = [
	  {
	    command = "border pixel 3";
	    criteria = {
	      class = "^.*";
	    };
	  }
	];
      };
      startup = [
      ];
      keybindings = lib.mkOptionDefault {
        # change focus
	"${modifier}+h" = "focus left";
	"${modifier}+j" = "focus down";
	"${modifier}+k" = "focus up";
	"${modifier}+l" = "focus right";

	# move focus window
	"${modifier}+Shift+h" = "move left";
	"${modifier}+Shift+j" = "move down";
	"${modifier}+Shift+k" = "move up";
	"${modifier}+Shift+l" = "move right";

	# resize window
	"${modifier}+r" = "mode resize";
      };
      modes.resize = {
	"h" 	 = "resize shrink width 10 px or 10 ppt";
	"j" 	 = "resize grow height 10 px or 10 ppt";
	"k" 	 = "resize shrink height 10 px or 10 ppt";
	"l"   	 = "resize grow width 10 px or 10 ppt";
	"Escape" = "mode default";
	"Return" = "mode default";
      };
      colors = {
        focused = {
          background	= col.mauve;
          text		= col.mantle;
          indicator	= col.rosewater;
          border	= col.mauve;
          childBorder	= col.mauve;
        };
        focusedInactive = {
          background	= col.base;
          text		= col.text;
          indicator	= col.rosewater;
          border	= col.overlay0;
          childBorder	= col.overlay0;
        };
        unfocused = {
          background	= col.base;
          text		= col.text;
          indicator	= col.rosewater;
          border	= col.overlay0;
          childBorder	= col.overlay0;
        };
        urgent = {
          background	= col.base;
          text		= col.peach;
          indicator	= col.overlay0;
          border	= col.peach;
          childBorder	= col.peach;
        };
        placeholder = {
          background	= col.base;
          text		= col.text;
          indicator	= col.overlay0;
          border	= col.overlay0;
          childBorder	= col.overlay0;
        };
      }; 

    };
  };

  services.picom = {
    enable = true;
    package = pkgs.picom;
  };


  programs.i3status = {
    enable = true;
  };

}
