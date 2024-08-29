# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, ... }:

{ 
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_IN";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
      LC_CTYPE="en_US.utf8"; # required by dmenu don't change this
    };
  };


  # touchpad settings
  services.libinput.touchpad = {
    disableWhileTyping = true;
    naturalScrolling = true;
    sendEventsMode = "disabled-on-external-mouse";
  };

  # setup x11
  services.xserver = {
    enable = true;

    # XFCE desktop environment
    # desktopManager.lightdm.enable = true;
    # desktopManager.xfce.enable = true;

    # i3 window manager setup
    windowManager.i3.enable = true;

    # Configure keymap in X11
    xkb.layout = "us";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.santu = {
    isNormalUser = true;
    description = "Santu";
    extraGroups = [ "networkmanager" "wheel" ];
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Install Fonts
  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      # fonts goes here
      meslo-lg

      # choose from specific nerdfonts
      (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };


  # Install system packages
  environment.systemPackages = 
    # recomended installing from stable branch
    (with pkgs; [
      # list of stable packages goes here
      vim

    ])
    
    ++

    # avoid installing from unstable branch
    # unless pkgs only work correctly in unstable branch
    (with pkgs-unstable; [
      # list of unstable packages goes here
      
    ]);


  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/santu/.dotfiles/nixos";
  };


  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?


  # enable experimentl features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
