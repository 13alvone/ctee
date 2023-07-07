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
sudo cp ctee cxwrite cxrun cxtiming cxrmclear /usr/local/bin/
sudo chmod +x /usr/local/bin/ctee /usr/local/bin/cxwrite /usr/local/bin/cxtiming /usr/local/bin/cxrun /usr/local/bin/cxrmclear

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

sudo chown -R $source_user:$source_group $HOME/.ctee/ /usr/local/bin/ctee /usr/local/bin/cxwrite 
sudo chown -R $source_user:$source_group /usr/local/bin/cxtiming /usr/local/bin/cxrun /usr/local/bin/cxrmclear
cp bashrc.ctee $HOME/.ctee/etc/
chmod +x $HOME/.ctee/etc/bashrc.ctee
echo "[+] Succesfully installed the bash version of ctee! 'ctee' can now be called from anywhere in the terminal to start command-line recording!\n"
echo "[+] Components added to your \$PATH via default location '/usr/local/bin/':"
echo "    [-] ctee --> A powerful pseudoshell with full functionality that records a local shell session."
echo "    [-] cxrun --> A quick command to rerun the most recently recorded session at an increased speed."
echo "    [-] cxtiming --> A quick script that adjusts and/or normalizes the timing file of a given script recording."
echo "    [-] cxrmclear --> A quick script that removes several control sequences for easier task output."
