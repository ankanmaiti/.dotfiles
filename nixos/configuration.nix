# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nixpkgs-unstable, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  # enable polkit
  security.polkit.enable = true;
 
  # # setup x11
  # services.xserver = {
  #   # Enable the X11 windowing system.
  #   enable = true;

  #   # Enable the Cinnamon Desktop Environment.
  #   displayManager.lightdm.enable = true;
  #   desktopManager.cinnamon.enable = true;

  #   # Configure keymap in X11
  #   xkb = {
  #     layout = "us";
  #     variant = "";
  #   };
  # };

  # hyprland
  programs.hyprland.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # # Enable sound with pipewire.
  # hardware.pulseaudio.enable = false;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   # If you want to use JACK applications, uncomment this
  #   #jack.enable = true;

  #   # use the example session manager (no others are packaged yet so this is enabled by default,
  #   # no need to redefine it in your config for now)
  #   #media-session.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # for global users
  users.defaultUserShell=pkgs.bash;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.santu = {
    isNormalUser = true;
    description = "Santu";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Brightness controll
  programs.light.enable = false;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install system packages
  environment.systemPackages = 
    # recomended installing from stable branch
    (with pkgs; [
      # list of stable packages goes here
      neovim
    ])
    
    ++

    # avoid installing from unstable branch
    # unless pkgs only work correctly in unstable branch
    (with nixpkgs-unstable; [
      # list of unstable packages goes here
      
    ]);


  # Nix cli helper
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/santu/nixos";
  };

  environment.sessionVariables = {
   #  # If cusor not shown
   #  WLR_NO_HARDWARE_CURSORS = "1";

   #  # Hint electron apps to use wayland
   #  NIXOS_OZONE_WL = "1";
  };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # enbale experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
