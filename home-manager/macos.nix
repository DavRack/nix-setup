{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.yabai
    pkgs.skhd
  ];

  home.file = {
    ".config/yabai" = {
      source = ../dotfiles/yabai;
      recursive = true;
    };

    ".config/skhd" = {
      source = ../dotfiles/skhd;
      recursive = true;
    };
  };
}
