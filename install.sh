#!/bin/bash

system=$(uname -o)

# install nix
command=$(curl -V > /dev/null && echo "curl -L" || echo "wget -O -")
url="https://nixos.org/nix/install"

install_command="$command $url"


if [ $system == "GNU/Linux" ]; then
  sh <(eval $install_command) --daemon --yes
elif [ $system == "Darwin" ]; then
  sh <(eval $install_command) --yes
else
  # get arch
  arch=$(uname -m)
  proot_url="https://dl-cdn.alpinelinux.org/alpine/edge/testing/$arch/proot-static-5.4.0-r0.apk"
  curl --output proot $proot_url
  chmod +x ./proot

  mkdir -p ~/.nix
  proot -b ~/.nix:/nix
  curl -L https://nixos.org/nix/install | sh

fi

mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# activate nix-daemon
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

bash <(eval "$command https://raw.githubusercontent.com/DavRack/nix-setup/master/home_manager_install.sh")
