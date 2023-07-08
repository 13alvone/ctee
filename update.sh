#!/usr/bin/env bash

# Save the current directory
current_dir=$(pwd)

# Change to the repository directory
cd "$HOME/.ctee/git/ctee/" || { kill -s TERM $$; exit 1; }

# Fetch updates from the remote repository
git fetch origin

# Get the current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Compare the local branch with the remote branch
git diff --quiet origin/"$current_branch"

# Check the exit status of the diff command.
# If there are no changes, the exit status will be 0, so the if-statement will run.
if [ $? -eq 0 ]; then
    echo "[i] CTEE Verified Up-To-Date. Continuing..."
else
    echo "[+] Remote Github changes were detected. Running CTEE Updater..."

    # Change back to HOME directory
    cd "$HOME" || { kill -s TERM $$; exit 1; }

    # Remove the old repository before cloning
    rm -rf ctee

    # Clone the repository
    git clone https://github.com/13alvone/ctee.git

    # Change to the new repository directory
    cd ctee || { kill -s TERM $$; exit 1; }

    # Run the install script
    ./install.sh

    echo "[+] CTEE updated. Please run ctee again for updated version..."

    # Return to the original directory
    cd "$current_dir" || { kill -s TERM $$; exit 1; }

    # Exit with status 1 to indicate that the script didn't complete normally
    kill -s TERM $$; exit 1
fi

# Return to the original directory
cd "$current_dir" || { kill -s TERM $$; exit 1; }

