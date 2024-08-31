{ config, lib, pkgs, pkgs-unstable, ... }:
let
in
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
  };
}
