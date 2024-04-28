{ config, pkgs, lib, ... }:
{
  imports = [ "./home.nix" ];

  home.packages = [
    pkgs.bspwm
    pkgs.sxhkd
    pkgs.flameshot
  ];

  home.file = {
    ".config/bspwm" = {
      source = ../dotfiles/bspwm;
      recursive = true;
    };

    ".config/sxkhd" = {
      source = ../dotfiles/sxkhd;
      recursive = true;
    };
  };
}
