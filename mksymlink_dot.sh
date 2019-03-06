#!/bin/bash

dir=~/dotfiles
files="bashrc vimrc"

cd $dir

for file in $files; do
    ln -sf $dir/$file ~/.$file
done
