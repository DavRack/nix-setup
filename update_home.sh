#!/bin/bash

install_editor=true
if command -v vim 2>&1 >/dev/null;then
	install_editor=false
fi

if $install_editor; then
	echo "### installing vim ###"
	nix-env -iA nixpkgs.vim
fi

home_modules=$(mktemp)
ls -1 ~/nix-setup/home-manager/ > "$home_modules"
vim "$home_modules"
MODULES_VALUE=$(cat "$home_modules" | xargs -n1 realpath | xargs -n1 -I{} \"{}\")

echo "### modules to install ###"
cat "$home_modules"

MODULES=$MODULES_VALUE home-manager switch -j 16

# cleanup
if $install_editor; then
	nix-env --uninstall vim
fi
