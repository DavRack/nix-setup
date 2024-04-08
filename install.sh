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

mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

bash <(eval "$command raw.githubusercontent.com/DavRack/nix-setup/master/home_manager_install.sh")

# u="raw.githubusercontent.com/DavRack/nix-setup/master/install.sh"; sh <(curl -L $u || wget -O - $u)
