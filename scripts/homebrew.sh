format_bold=$(tput bold)
format_normal=$(tput sgr0)

echo "Checking for ${format_bold}Homebrew${format_normal}..."

which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew not found. Installing it..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew found. Updating it..."
  brew update
fi

# various libraries
echo "Installing ${format_bold}various libraries${format_normal}..."
brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc libpq zlib curl ossp-uuid v8

# zsh
echo "Checking for ${format_bold}zsh${format_normal} via Homebrew..."
if brew ls --versions zsh > /dev/null; then
  echo "zsh found. Updating it..."
  brew upgrade zsh
else
  echo "zsh not found. Installing it..."
  brew install zsh
  chsh -s $(which zsh)
fi

# oh-my-zsh
echo "Checking for ${format_bold}oh-my-zsh${format_normal}..."
if ls -d ~/.oh-my-zsh > /dev/null; then
  echo "oh-my-zsh found. Moving on..."
else
  echo "oh-my-zsh not found. Installing it..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# git
echo "Checking for ${format_bold}git${format_normal} via Homebrew..."
if brew ls --versions git > /dev/null; then
  echo "Git found. Updating it..."
  brew upgrade git
else
  echo "Git not found. Installing it..."
  brew install git
fi

# gpg
echo "Checking for ${format_bold}gpg${format_normal} via Homebrew..."
if brew ls --versions gpg > /dev/null; then
  echo "gpg found. Updating it..."
  brew upgrade gpg
else
  echo "gpg not found. Installing it..."
  brew install gpg
fi

# gcc
echo "Checking for ${format_bold}gcc${format_normal} via Homebrew..."
if brew ls --versions gcc > /dev/null; then
  echo "gcc found. Updating it..."
  brew upgrade gcc
else
  echo "gcc not found. Installing it..."
  brew install gcc
fi

# fzf
echo "Checking for ${format_bold}fzf${format_normal} via Homebrew..."
if brew ls --versions fzf > /dev/null; then
  echo "fzf found. Updating it..."
  brew upgrade fzf
else
  echo "fzf not found. Installing it..."
  brew install fzf
fi

echo "Setting up fzf..."
$(brew --prefix)/opt/fzf/install

# docker
echo "Checking for ${format_bold}docker${format_normal} via Homebrew..."
if brew ls --versions docker > /dev/null; then
  echo "docker found. Updating it..."
  brew upgrade docker
else
  echo "docker not found. Installing it..."
  brew install docker
fi

# colima (docker engine)
echo "Checking for ${format_bold}colima${format_normal} via Homebrew..."
if brew ls --versions colima > /dev/null; then
  echo "colima found. Updating it..."
  brew upgrade colima
else
  echo "colima not found. Installing it..."
  brew install colima
fi

# localstack-cli
echo "Checking for ${format_bold}localstack-cli${format_normal} via Homebrew..."
if brew ls --versions localstack-cli > /dev/null; then
  echo "localstack-cli found. Updating it..."
  brew upgrade localstack-cli
else
  echo "localstack-cli not found. Installing it..."
  brew install localstack/tap/localstack-cli
fi

echo "Cleaning up Homebrew..."
brew cleanup

echo "Done with Homebrew."
