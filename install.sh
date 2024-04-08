#!/bin/bash

system=$(uname -o)

command=$(curl -V > /dev/null && echo "curl -L" || echo "wget -O -")
url="https://nixos.org/nix/install"

install_command="$command $url"


if [ $system == "GNU/Linux" ]; then
  sh <(curl -L https://nixos.org/nix/install) --daemon
elif [ $system == "Darwin" ]; then
  sh <(curl -L https://nixos.org/nix/install)
fi
