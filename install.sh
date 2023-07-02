#!/bin/zsh

sudo mkdir -p $HOME/.ctee/etc/

sudo cp ctee /usr/local/bin/
sudo chmod +x /usr/local/bin/ctee
sudo cp zshrc.ctee $HOME/.ctee/etc/
sudo chmod +x $HOME/.ctee/etc/zshrc.ctee

