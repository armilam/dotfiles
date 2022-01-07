format_bold=$(tput bold)
format_normal=$(tput sgr0)

echo "Checking for ${format_bold}Homebrew${format_normal}..."

which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew not found. Installing it..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew found. Updating it..."
  brew update
fi

# various libraries
echo "Installing ${format_bold}various libraries${format_normal}..."
brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc libpq zlib curl ossp-uuid

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

echo "Cleaning up Homebrew..."
brew cleanup

echo "Done with Homebrew."
