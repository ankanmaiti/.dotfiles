{ config, pkgs, pkgs-unstable, ... }:

{
  # kitty setup
  programs.kitty = {
    enable = true;
    package = pkgs-unstable.kitty;
    theme = "Catppuccin-Mocha";
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    # shellIntegration = {
    #   enableBashIntegration = true;
    #   enableZshIntegration = true;
    # };
    settings = {
      # ligatures
      disable_ligatures = "never";

      # window styling
      hide_window_decorations = "yes";
      window_padding_width = 0;
      
      # blur-transparent background
      dynamic_background_opacity = "yes";
      background_opacity = "0.5";
      background_blur = "1";
      dim_opacity = "0.4";
    };
  };
}

