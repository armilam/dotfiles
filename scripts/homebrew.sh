echo "Checking for Homebrew..."

which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew not found. Installing it..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew found. Updating it..."
  brew update
fi

# git via Homebrew

# gpg via Homebrew
