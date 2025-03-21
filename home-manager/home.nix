{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "david";
  home.homeDirectory = "/home/david";

	imports = [
	]
	++ lib.strings.splitString "\n" (builtins.getEnv "MODULES");

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # pkgs is the set of all packages in the default home.nix implementation
    pkgs.btop
    pkgs.cargo
    pkgs.cmake
    pkgs.coreutils-full
    pkgs.curl
    pkgs.docker
    pkgs.exiftool
    pkgs.fd
    pkgs.fzf
    pkgs.gcc
    pkgs.git
    pkgs.gnumake
    pkgs.go
    pkgs.jq
    pkgs.neovim
    pkgs.python3
    pkgs.ripgrep
    pkgs.rust-analyzer
    pkgs.silver-searcher
    pkgs.tmux
    pkgs.tree
    pkgs.zsh
    pkgs.curl
    pkgs.unzip
    pkgs.nodejs
    pkgs.opam
    pkgs.fontconfig
  ];

  fonts.fontconfig.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/alacritty" = {
      source = ../dotfiles/alacritty;
      recursive = true;
    };
    ".config/btop" = {
      source = ../dotfiles/btop;
      recursive = true;
    };
    ".zshrc" = {
      source = ../dotfiles/.zshrc;
      recursive = true;
    };
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink ../dotfiles/nvim;
      recursive = true;
    };
  };

  # home.activation = {
  #   setupNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #     ln -sf /home/david/nix-setup/dotfiles/nvim ~/.config/nvim
  #   '';
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/david/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
