format_bold=$(tput bold)
format_normal=$(tput sgr0)

echo "Checking for ${format_bold}asdf${format_normal}..."

which -s asdf
if [[ $? != 0 ]] ; then
  echo "asdf not found. Installing it..."

  echo "Visit https://github.com/asdf-vm/asdf to find versions."
  printf "Enter ${format_bold}asdf${format_normal} version you'd like to install: "
  read version

  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v$version
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
  asdf install ruby 2.5.3
  asdf use ruby 2.5.3
  gem install bundler
  asdf global ruby 2.5.3
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
  export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/lib -L/usr/local/opt/expat/lib"
  export CFLAGS="-I/usr/local/opt/openssl/include/ -I/usr/local/include -I/usr/local/opt/expat/include"
  export CPPFLAGS="-I/usr/local/opt/openssl/include/ -I/usr/local/include -I/usr/local/opt/expat/include"
  asdf plugin-add postgres https://github.com/smashedtoatoms/asdf-postgres.git
  POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-uuid=e2fs --with-openssl" asdf install postgres 9.6.8
  asdf global postgres 9.6.8
fi

# Redis
echo -e "\nChecking for ${format_bold}redis${format_normal}..."

if asdf which redis > /dev/null; then
  echo "Redis found. Updating plugin..."
  asdf plugin-update redis
else
  # TODO: Ask for version(s) to install
  asdf plugin-add redis https://github.com/smashedtoatoms/asdf-redis.git
  asdf install redis 5.0.0
  asdf global redis 5.0.0
fi

# TODO: Java
# TODO: elasticsearch (depends on Java)

echo "Done with asdf."
