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

# Ruby
echo "Checking for ruby..."

if asdf which ruby > /dev/null; then
  echo "Ruby found. Updating it..."
  asdf plugin-update ruby
else
  echo "Ruby not found. Installing it..."
  # TODO: Ask for version(s) to install
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

  # For Lessonly
  asdf install ruby 2.4.2
  asdf use ruby 2.4.2
  gem install bundler

  # Latest
  asdf install ruby 2.5.1
  asdf use ruby 2.5.1
  gem install bundler
  asdf global ruby 2.5.1
fi

# NodeJS
echo "Checking for nodejs..."

if asdf which nodejs > /dev/null; then
  echo "NodeJS found. Updating it..."
  asdf plugin-update nodejs
else
  # TODO: Ask for version(s) to install
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

  # Lessonly
  asdf install nodejs 10.9.0
  asdf global nodejs 10.9.0
fi

# TODO: All the plugins

echo "Done with asdf."
