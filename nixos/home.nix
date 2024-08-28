{ config, pkgs, nixpkgs-unstable, ... }:

{
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
      hello
      lazygit
      neofetch
    ])
    
    ++

    # avoid installing from unstable branch
    # unless pkgs only work correctly in unstable branch
    (with nixpkgs-unstable; [ 
      # list of unstable packages goes here
       
    ]);


  programs.git = {
    enable = true;
    userName = "Ankan Maiti";
    userEmail = "ankanmaiti2@gmail.com";
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
