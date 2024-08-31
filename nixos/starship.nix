{ config, lib, pkgs, pkgs-unstable, ... }:
{
  programs.starship = {
  enable = true;
  package = pkgs.starship;
  enableBashIntegration = true;
  enableZshIntegration = true;
  };

  programs.starship.settings = {
    add_newline 		= true;
    # format 			= "$directory $all\n$character" ;
    format = lib.concatStrings [
      "$directory"
      "$all"
      "$line_break"
      "$character"
    ];
    continuation_prompt 	= "▶▶ ";

    package.disabled 		= true;

    character.success_symbol 	= "[➜](bold green)";
    character.error_symbol 	= "[➜](bold red)";

    git_branch.format 		=  "[$symbol$branch](bold gray) ";
    git_branch.symbol 		= " ";
    git_status.disabled 	= false;

    lua.symbol 			= " ";
    palette			= "catppuccin_mocha";

  };

  programs.starship.settings.palettes = {
    catppuccin_mocha = {
      rosewater 		= "#f5e0dc";
      flamingo 			= "#f2cdcd";
      pink 			= "#f5c2e7";
      mauve 			= "#cba6f7";
      red 			= "#f38ba8";
      maroon 			= "#eba0ac";
      peach 			= "#fab387";
      yellow 			= "#f9e2af";
      green 			= "#a6e3a1";
      teal 			= "#94e2d5";
      sky 			= "#89dceb";
      sapphire 			= "#74c7ec";
      blue 			= "#89b4fa";
      lavender 			= "#b4befe";
      text 			= "#cdd6f4";
      subtext1 			= "#bac2de";
      subtext0 			= "#a6adc8";
      overlay2 			= "#9399b2";
      overlay1 			= "#7f849c";
      overlay0 			= "#6c7086";
      surface2 			= "#585b70";
      surface1 			= "#45475a";
      surface0 			= "#313244";
      base 			= "#1e1e2e";
      mantle 			= "#181825";
      crust 			= "#11111b";
    };
  };
}
