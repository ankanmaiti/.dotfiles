{ config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    # ./i3.nix
    # ./i3blocks.nix
    # ./polybar.nix

    ./sway.nix
    ./waybar.nix

    ./yazi.nix
    ./bash.nix
    ./kitty.nix
    ./starship.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "santu";
  home.homeDirectory = "/home/santu";


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = 
    # recomended installing from stable branch
    (with pkgs; [
      # list of stable packages goes here
      lazygit
      firefox
      neofetch
      xclip
      psmisc # give killall features
      libinput
    ])
    ++

    # avoid installing from unstable branch
    # unless pkgs only work correctly in unstable branch
    (with pkgs-unstable; [ 
      # list of unstable packages goes here
      neovim
      tmux

      # i3 related
      # dmenu
      # polybar
    ]);




  # btop setup
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "Ankan Maiti";
    userEmail = "ankanmaiti2@gmail.com";
  };


  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL  = "bash";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
