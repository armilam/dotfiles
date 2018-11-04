echo "Checking for asdf..."

which -s asdf
if [[ $? != 0 ]] ; then
  echo "asdf not found. Installing it..."
  # TODO: Ask for what version, or find the latest stable version to install
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0
else
  echo "adsf found. Updating it..."
  asdf update
fi

# TOOD: All the plugins

echo "Done with asdf."
