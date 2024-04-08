#!/bin/bash

system=$(uname -o)

if [ $system == "GNU/Linux" ]; then
  sh <(curl -L https://nixos.org/nix/install) --daemon
elif [ $system == "Darwin" ]; then
  sh <(curl -L https://nixos.org/nix/install)
fi
