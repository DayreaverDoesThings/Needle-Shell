#!/usr/bin/env bash

if [ ! -d "src" ]; then
    echo "Error: 'src/' directory not found."
    exit 1
fi

cd src

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
    if command -v bundle &> /dev/null; then
        local version
        version=$(bundle -v | grep -oP '\d+\.\d+\.\d+')
        if [ "$version" != "2.5.11" ]; then
            echo "Bundler version is $version, but 2.5.11 is required. Installing the correct version..."
            gem install bundler -v 2.5.11
        else
            echo "Bundler 2.5.11 is OK."
        fi
    else
        echo "Bundler is not installed. Installing Bundler 2.5.11..."
        gem install bundler -v 2.5.11
    fi
}

if [ ! -f "Gemfile" ]; then
    echo "Error: 'Gemfile' not found in the current directory."
    exit 1
fi

if [ ! -f "Gemfile.lock" ]; then
    echo "Warning: 'Gemfile.lock' not found. Installing gems might result in different versions."
fi

check_pacman
check_ruby
check_bundle

echo "Installing Ruby gems..."
bundle install

echo "Changing permissions..."
if ! chmod +x ndle.rb; then
    echo "Error: Failed to change permissions for 'ndle.rb'."
    exit 1
fi

echo "Current Ruby version:"
ruby -v

echo "Running 'ndle.rb'..."
if ! ./ndle.rb; then
    echo "Error: 'ndle.rb' failed to execute."
    exit 1
fi
