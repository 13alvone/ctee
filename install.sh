#!/bin/bash

if [ "$(id -u)" = "0" ]; then
    echo "[x] This script should not be started with SUDO but will request it for a few subcommands.." >&2
    exit 1
fi

# Check if the application is already installed
if [ -d "$HOME/.ctee" ] || [ -f "/usr/local/bin/ctee" ]; then
    echo "The application is already installed at the target location. Exiting the installation..." >&2
    exit 1
fi

script_dir=$(dirname "$0")
user_home=$(eval echo $HOME)
source_user=$(eval whoami)

mkdir -p $HOME/.ctee/etc/
mkdir -p $HOME/.ctee/git/
echo "[i] Requesting SUDO to place binary in production: /usr/local/bin/"
sudo cp ctee cxwrite cxrun cxtiming cxrmclear clook /usr/local/bin/
sudo chmod +x /usr/local/bin/ctee /usr/local/bin/cxwrite /usr/local/bin/cxtiming 
sudo chmod +x /usr/local/bin/cxrun /usr/local/bin/cxrmclear /usr/local/bin/clook

# Attempt to install any potentially missing python3 libraries in use
sudo pip3 install colorama
sudo pip3 install reportlab

# Check the operating system
OS="unknown"
source_group="MISSING_CHECK_INSTALL_SH"
if [[ "$(uname)" == "Darwin" ]]; then
    OS="Mac"
    source_group="staff"
elif [[ "$(uname)" == "Linux" ]]; then
    OS="Linux"
    source_group=$source_user
fi

sudo chown -R $source_user:$source_group $HOME/.ctee/ /usr/local/bin/ctee /usr/local/bin/cxwrite /usr/local/bin/clook
sudo chown -R $source_user:$source_group /usr/local/bin/cxtiming /usr/local/bin/cxrun /usr/local/bin/cxrmclear
cp bashrc.ctee $HOME/.ctee/etc/
chmod +x $HOME/.ctee/etc/bashrc.ctee
echo "[+] Succesfully installed the bash version of ctee! 'ctee' can now be called from anywhere in the terminal to start command-line recording!"
echo "[+] Components added to your \$PATH via default location '/usr/local/bin/':"
echo "    [-] ctee --> A powerful pseudoshell with full functionality that records a local shell session."
echo "    [-] cxrun --> A quick command to rerun the most recently recorded session at an increased speed."
echo "    [-] cxtiming --> A quick script that adjusts and/or normalizes the timing file of a given script recording."
echo "    [-] cxrmclear --> A quick script that removes several control sequences for easier task output."
echo "    [-] cxwrite --> A quick script that writes notes via CLI during a ctee session."
echo "    [-] clook --> A post-session command, stdout, and notes reviewer for searching and parsing your work."

mv $HOME/ctee/ $HOME/.ctee/git/

