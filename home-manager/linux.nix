{ config, pkgs, lib, ... }:
{
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
      source = ../dotfiles/sxhkd;
      recursive = true;
    };
  };
}
