#!/usr/bin/env bash

current_dir=$(pwd)
cd $HOME/.ctee/git/ctee/
# Fetch updates from the remote repository
git fetch origin

# Compare the local and remote repositories
git diff --quiet origin/master

# Check the exit status of the diff command.
# If there are no changes, the exit status will be 0, so the if-statement will run.
if [ $? -eq 0 ]; then
    echo "[i] CTEE Verfied Up-To-Date. Continuing..."
else
    echo "[+] Remote Github changes were detected. Running CTEE Updater..."
    cd $HOME
    git clone https://github.com/13alvone/ctee.git
    cd $HOME/ctee
    ./install.sh
fi

cd $current_dir
