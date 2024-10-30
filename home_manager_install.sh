#!/bin/bash
cd

# clone repo
nix-env -iA nixpkgs.git
git clone https://github.com/DavRack/nix-setup.git
nix-env --uninstall git

# install home-manager

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install


rm -rf ~/.config/home-manager
ln -s ~/nix-setup/home-manager ~/.config/

bash ~/nix-setup/update_home.sh
