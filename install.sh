#!/bin/bash

system=$(uname -o)

# install nix
command=$(curl -V > /dev/null && echo "curl -L" || echo "wget -O -")
url="https://nixos.org/nix/install"

install_command="$command $url"


if [ $system == "GNU/Linux" ]; then
  sh <(eval $install_command) --daemon
elif [ $system == "Darwin" ]; then
  sh <(eval $install_command)
fi
bash
# install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
