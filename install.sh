#!/usr/bin/env bash

# Install ~/.vimrc, the vim plugins, and bash aliases

echo "Installing vimrc ..."
cp vim/vimrc $HOME/.vimrc

source update_vim_plugins.sh

echo "Installing screenrc ..."
cp screen/screenrc $HOME/.screenrc

echo "Installing bash aliases ..."
cat shell/aliases >> $HOME/.bashrc

echo "Installing bashrc extensions ..."
cat shell/bashrc >> $HOME/.bashrc

echo "Installing terminator config ..."
mkdir -p ~/.config/terminator/                                                   
cp shell/terminator_config ~/.config/terminator/config

echo "Done"
