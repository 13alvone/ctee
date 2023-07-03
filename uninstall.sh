#!/bin/zsh

if [ "$(id -u)" = "0" ]; then
    echo "[x] This script should not be started with with SUDO but will request it for a few subcommands.." >&2
    exit 1
fi

user_home=$(eval echo $HOME)
source_user=$(eval whoami)

# Moving the cxwrite_notes.db to /tmp and renaming to make it clear that this is a temporary backup of the notes database.
# This provides small grace period for users to preserve their notes.db after uninstall before they are deleted by the system."
mv $HOME/.ctee/cxwrite_notes.db /tmp/BACKUP_cxwrite_notes.db
sudo chown -R root:root /tmp/BACKUP_cxwrite_notes.db
sudo chmod -R 755 /tmp/BACKUP_cxwrite_notes.db


echo "[i] Requesting SUDO to remove binary in production: /usr/local/bin/ and $HOME/.ctee/ directories.\n"
sudo rm -rf $HOME/.ctee/
sudo rm -rf /usr/local/bin/ctee /usr/local/bin/cxwrite /usr/local/bin/zero_timing
echo "[+] Removed the following components successfully and fully uninstalled CTEE:"
echo "\n\t[-] Removed: $HOME/.ctee/\n\t[-] Removed: /usr/loca/bin/ctee\n\t[-] Removed: /usr/local/bin/cxwrite\n"

