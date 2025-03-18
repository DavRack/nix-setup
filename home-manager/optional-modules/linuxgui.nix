{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.alacritty
    # pkgs.bspwm
    # pkgs.sxhkd
    pkgs.flameshot
		pkgs.hyprland
		pkgs.kitty
		pkgs.uwsm
  ];

  home.file = {
    # ".config/bspwm" = {
    #   source = ../dotfiles/bspwm;
    #   recursive = true;
    # };

    # ".config/sxkhd" = {
    #   source = ../dotfiles/sxhkd;
    #   recursive = true;
    # };
  };
}
