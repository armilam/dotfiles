#!/bin/bash

project_dir="${HOME}/dotfiles"
dotfiles=(".bash_profile")

echo "Creating dotfiles symlinks..."
# TODO: Just loop through all the files in the home directory, instead of a defined list
for dotfile in "${dotfiles[@]}";do
  # TODO: Rename existing dotfiles to add .old so we don't lose what may already be there
  ln -sv ${project_dir}/home/${dotfile} ${HOME}
done

# Homebrew

# git via Homebrew

# gpg via Homebrew

echo "Installing asdf..."
# TODO: Skip if it's already installed
# TODO: Find or ask for the latest version number
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0

echo "Installing ruby..."
# TODO: Skip if it's already installed
# TODO: Ask for desired version numbers?
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.4.2
asdf use ruby 2.4.2
gem install bundler
asdf install ruby 2.5.1
asdf use ruby 2.5.1
gem install bundler
asdf global ruby 2.5.1

echo "Installing nodejs..."
# TODO: Skip if it's already installed
# TODO: Ask for desired version numbers?
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 10.9.0
asdf global nodejs 10.9.0

# PostgreSQL via asdf

# Redis via asdf

# Java via asdf

# elasticsearch via asdf

# Set up Github SSH

# Heroku CLI

# Projects
echo "Creating project directory..."
mkdir ~/Documents/Projects
# TODO: Clone anything?

# Lessonly
echo "Setting up Lessonly environment..."
mkdir -p ~/Documents/Lessonly/Source
git clone git@github.com:lessonly/lessonly.git ~/Documents/Lessonly/Source
# TODO: Clone anything else? Provide a list of options?
