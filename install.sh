#!/bin/bash

if [ "$(id -u)" = "0" ]; then
    echo "[x] This script should not be started with with SUDO but will request it for a few subcommands.." >&2
    exit 1
fi

script_dir=$(dirname "$0")
user_home=$(eval echo $HOME)
source_user=$(eval whoami)

mkdir -p $HOME/.ctee/etc/
echo "[i] Requesting SUDO to place binary in production: /usr/local/bin/\n"
sudo cp ctee cxwrite zero_timing /usr/local/bin/
sudo chmod +x /usr/local/bin/ctee /usr/local/bin/cxwrite /usr/local/bin/zero_timing
sudo chown -R $source_user:$source_user /home/$source_user/.ctee/ /usr/local/bin/ctee /usr/local/bin/cxwrite /usr/local/bin/zero_timing
cp bashrc.ctee $HOME/.ctee/etc/
chmod +x $HOME/.ctee/etc/bashrc.ctee
echo "[+] Succesfully installed the bash version of ctee! 'ctee' can now be called from anywhere in the terminal to start command-line recording!\n"
