#!/usr/bin/env bash

# Install ~/.vimrc, the vim plugins, and bash aliases

echo "Installing vimrc ..."
cp vim/vimrc $HOME/.vimrc

source update_vim_plugins.sh

echo "Installing bash aliases ..."
cat shell/aliases >> $HOME/.bashrc

echo "Installing bashrc extensions ..."
cat shell/basrhc >> $HOME/.bashrc

echo "Done"
