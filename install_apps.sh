echo "Installing common apps via brew cask..."

xcode-select --install
sudo xcodebuild -license accept

brew install jq
brew install htop
brew install curl
brew install git
brew install git-lfs
brew install cmake
brew install readline
brew install nmap
brew install the_silver_searcher	# very fast search using command 'ag'
brew install dos2unix
brew install netcat
brew install tldr 					# friendly version of linux 'man'
brew install tmux
brew install coreutils

brew install --cask cheatsheet
brew install --cask vlc
brew install --cask whatsapp
brew install --cask dropbox
brew install --cask lastpass
brew install --cask google-drive
brew install --cask notion
brew install --cask microsoft-office
brew install --cask spotify
brew install --cask zoom
brew install --cask kindle
brew install --cask slack
brew install --cask alfred

brew install --cask sublime-text

brew install --cask android-platform-tools
brew install --cask android-sdk
brew install --cask android-commandlinetools
brew install --cask android-studio
brew install scrcpy

brew install --cask visual-studio
brew install --cask visual-studio-code

brew install --cask docker
brew install --cask postman
brew install helm
brew install golang
brew install minikube
brew install packer
brew install --cask wireshark
brew install gstreamer

brew install --cask adobe-creative-cloud

