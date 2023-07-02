#!/bin/zsh

if [ "$(id -u)" = "0" ]; then
    echo "[x] This script should not be started with with SUDO but will request it for a few subcommands.." >&2
    exit 1
fi

user_home=$(eval echo $HOME)
source_user=$(eval whoami)

echo "[i] Requesting SUDO to remove binary in production: /usr/local/bin/ and $HOME/.ctee/ directories.\n"
sudo rm -rf $HOME/.ctee/
sudo rm -rf /usr/local/bin/ctee
echo "[+] Removed the following components successfully and fully uninstalled CTEE:\n\t[-] Removed: $HOME/.ctee/\n\t[-] Removed: /usr/loca/bin/ctee\n"
