#!/bin/zsh

if [ "$(id -u)" = "0" ]; then
    echo "[x] This script should not be started with SUDO but will request it for a few subcommands.." >&2
    exit 1
fi

user_home=$(eval echo $HOME)
source_user=$(eval whoami)

# Moving the cxwrite_notes.db to /tmp and renaming to make it clear that this is a temporary backup of the notes database.
# This provides small grace period for users to preserve their notes.db after uninstall before they are deleted by the system."

db_file="$HOME/.ctee/cxwrite_notes.db"
backup_file="/tmp/BACKUP_cxwrite_notes.db"

if [[ -f "$db_file" ]]; then
    sudo mv -f "$db_file" "$backup_file"
    if [[ -f "$backup_file" ]]; then
        sudo chown -R root:root "$backup_file"
        sudo chmod -R 755 "$backup_file"
        echo "[+] Backup file was created successfully: $backup_file"
    fi
fi

echo "[i] Requesting SUDO to remove binary in production: /usr/local/bin/ and $HOME/.ctee/ directories.\n"
sudo rm -rf $HOME/.ctee/
sudo rm -rf /usr/local/bin/ctee
sudo rm -rf /usr/local/bin/cxwrite
sudo rm -rf /usr/local/bin/cxtiming
sudo rm -rf /usr/local/bin/cxrun
sudo rm -rf /usr/local/bin/cxrmclear
sudo rm -rf /usr/local/bin/clook
echo "[+] Removed the following components successfully and fully uninstalled CTEE:"
echo ""
echo "    [x] REMOVED: $HOME/.ctee/"
echo "    [x] REMOVED: /usr/local/bin/ctee"
echo "    [x] REMOVED: /usr/local/bin/cxwrite"
echo "    [x] REMOVED: /usr/local/bin/cxrun"
echo "    [x] REMOVED: /usr/local/bin/cxtiming"
echo "    [x] REMOVED: /usr/local/bin/cxrmclear"
echo "    [x] REMOVED: /usr/local/bin/clook"
echo ""

