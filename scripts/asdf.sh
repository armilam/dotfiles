format_bold=$(tput bold)
format_normal=$(tput sgr0)

echo "Checking for ${format_bold}asdf${format_normal}..."

which -s asdf
if [[ $? != 0 ]] ; then
  echo "asdf not found. Installing it..."
  # TODO: Ask for what version, or find the latest stable version to install
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0
else
  echo "asdf found. Updatpostgres ing it..."
  asdf update
fi

# Ruby
echo -e "\nChecking for ${format_bold}ruby${format_normal}..."

if asdf which ruby > /dev/null; then
  echo "Ruby found. Updating plugin..."
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
echo -e "\nChecking for ${format_bold}nodejs${format_normal}..."

if asdf which nodejs > /dev/null; then
  echo "NodeJS found. Updating plugin..."
  asdf plugin-update nodejs
else
  # TODO: Ask for version(s) to install
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

  # Lessonly
  asdf install nodejs 10.9.0
  asdf global nodejs 10.9.0
fi

# PostgreSQL
echo -e "\nChecking for ${format_bold}postgres${format_normal}..."

if asdf which postgres > /dev/null; then
  echo "PostgreSQL found. Updating plugin..."
  asdf plugin-update postgres
else
  # TODO: Ask for version(s) to install
  asdf plugin-add postgres https://github.com/smashedtoatoms/asdf-postgres.git
  POSTGRES_EXTRA_CONFIGURE_OPTIONS=--with-uuid=e2fs asdf install postgres 9.6.8
  asdf global postgres 9.6.8
fi

# TODO: All the plugins

echo "Done with asdf."
