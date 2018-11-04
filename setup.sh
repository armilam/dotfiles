#!/bin/bash

dotfiles=(".bash_profile")
dir="${HOME}/dotfiles"

for dotfile in "${dotfiles[@]}";do
  ln -sv ${dir}/${dotfile} ${HOME}
done

