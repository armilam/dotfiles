#!/bin/bash

project_dir="${HOME}/dotfiles"

format_bold=$(tput bold)
format_normal=$(tput sgr0)

# Dotfiles
echo -e "\n${format_bold}Dotfiles${format_normal}"
$project_dir/scripts/dotfiles.sh $project_dir

# Homebrew
echo -e "\n${format_bold}Homebrew${format_normal}"
$project_dir/scripts/homebrew.sh

# asdf
echo -e "\n${format_bold}asdf${format_normal}"
$project_dir/scripts/asdf.sh

exit 0

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
