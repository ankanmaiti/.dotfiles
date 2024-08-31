{ config, lib, pkgs, pkgs-unstable, ... }:
{
  programs.bash = {
    enable = true;
    historySize = 1000;
    historyFileSize = 2000;
  };
}
