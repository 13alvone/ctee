#!/bin/zsh
set -x

if [ "$(id -u)" = "0" ]; then
    echo "[x] This script should not be started with with SUDO but will request it for a few subcommands.." >&2
    exit 1
fi

user_home=$(eval echo $HOME)
source_user=$(eval whoami)

mkdir -p $HOME/.ctee/etc/
echo "[+] Requesting SUDO to place binary in production: /usr/local/bin/\n"
sudo cp ctee /usr/local/bin/
sudo chown -R $source_user:$source_user /home/$source_user/.ctee/
sudo chmod +x /usr/local/bin/ctee
cp zshrc.ctee /home/$source_user/.ctee/etc/
chmod +x /home/$source_user/.ctee/etc/zshrc.ctee

