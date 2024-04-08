#!/bin/bash
# u="https://raw.githubusercontent.com/DavRack/nix-setup/master/install.sh"; bash <(curl -L $u || wget -O - $u)

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

bash <(eval "$command https://raw.githubusercontent.com/DavRack/nix-setup/master/home_manager_install.sh")
