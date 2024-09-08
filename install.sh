#!/usr/bin/env bash

set -e

check_pacman() {
    if ! command -v pacman &> /dev/null; then
      echo "Pacman is not found. This script is intended for Arch-based systems."
      exit 1
    else
      echo "Pacman is OK."
    fi
}

check_ruby() {
    if ! command -v ruby &> /dev/null; then
      echo "Ruby is not installed. Installing Ruby..."
      sudo pacman -S --noconfirm ruby
    else
      echo "Ruby is OK."
    fi         
}

check_bundle() {
    if ! command -v bundle &> /dev/null; then
        echo "Bundler is not installed. Installing Bundler..."
        gem install bundler
    else
        echo "Bundler is OK."
    fi
}

if [ ! -f "Gemfile" ]; then
    echo "Error: 'Gemfile' not found in the current directory."
    exit 1
fi

check_pacman
check_ruby
check_bundle

echo "Installing Ruby gems..."
bundle install

echo "Changing permissions..."
chmod +x ndle.rb

echo "Current Ruby version:"
ruby -v

echo "Running 'ndle.rb'..."
./ndle.rb
