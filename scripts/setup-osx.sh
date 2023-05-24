# Applying custom configuration
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
defaults write .GlobalPreferences com.apple.mouse.scaling -1
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Enabling Rosetta for compatibility
sudo softwareupdate --install-rosetta --agree-to-license

# Install XCode
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

