#!/bin/bash
set -x

PWD=$(pwd)

ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_profile ~/.bash_profile
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.xinitrc ~/.xinitrc
ln -s $PWD/.nanorc ~/.nanorc
ln -s $PWD/.vimrc ~/.vimrc

mkdir -p ~/.cargo
ln -s $PWD/.cargo/env ~/.cargo/env
