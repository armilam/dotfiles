# Get started

1. Install [iTerm2](https://iterm2.com/)
2. Clone this repo to ~/dotfiles
3. cd into the `dotfiles` directory
4. Run `./setup.sh`

This will:

1. Clone dotfiles
   - .gitconfig
   - .git_completion
   - .zshrc
   - and others
2. Install Homebrew and some packages I'll likely need
   - git
   - gpg
   - gcc
   - and others
3. Install asdf and some tools I'll likely need
   - ruby
   - nodejs
   - postgres
   - redis

# Manual software installation

You'll also want to install these things:

- [1Password](https://1password.com/downloads/mac/)
- [Chrome](https://www.google.com/chrome/)
  - [1Password](https://chrome.google.com/webstore/detail/1password-%E2%80%93-password-mana/aeblfdkhhhdcdjpifhhbdiojplfjncoa)
  - [Workona](https://chrome.google.com/webstore/detail/workona-tab-manager/ailcmbgekjpnablpdkmaaccecekgdhlh)
  - [Pushbullet](https://chrome.google.com/webstore/detail/pushbullet/chlffgpmiacpedhhbkiomidkjlcfhogd)
  - [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
  - [Rails Panel](https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg)
- [iTerm2](https://iterm2.com/)
  - Here is where you should [get started](#get-started) with the setup script.
- [Logi Options+](https://www.logitech.com/en-us/software/logi-options-plus.html)
- [Logi Tune](https://www.logitech.com/en-us/video-collaboration/software/logi-tune-software.html)
    - For Logitech camera
- [Logitech G Hub](https://www.logitechg.com/en-us/innovation/g-hub.html)
- [Alfred 5](https://www.alfredapp.com/)
  - Enable the powerpack. Your license code is in your email.
- [VS Code](https://code.visualstudio.com/download)
    - [VS Code - Insiders](https://code.visualstudio.com/insiders/) (as long as I am subscribed to GitHub Copilot)
    - [GitHub Copilot Chat](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat)
- [Sublime Text](https://www.sublimetext.com/)
    - Better for mass-editing large files
- [Kap](https://getkap.co/)
- Docker
    - Docker Desktop license sucks. Don't even install it.
    - I now install [docker CLI via homebrew](https://formulae.brew.sh/formula/docker) with `brew install docker`
    - I also need [colima](https://github.com/abiosoft/colima) to act as the docker engine
        ```
        $ brew install colima
        $ colima start
        $ docker ps
        ```
- [Dropbox](https://www.dropbox.com/install)
- [Zoom](https://zoom.us/download)
- [Daisy Disk](https://apps.apple.com/us/app/daisydisk/id411643860)
- [Kaleidoscope](https://kaleidoscope.app/)
  - [ksdiff](https://kaleidoscope.app/ksdiff2)
- [OneNote](https://www.onenote.com/download)
- [Pixelmator Pro](https://apps.apple.com/us/app/pixelmator-pro/id1289583905?mt=12)
- [Postman](https://www.postman.com/downloads/)
- [Slack](https://apps.apple.com/us/app/slack-for-desktop/id803453959)
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12)
- [Magnet](https://apps.apple.com/us/app/magnet/id441258766?mt=12)
- [MeetingBar](https://meetingbar.app/)
