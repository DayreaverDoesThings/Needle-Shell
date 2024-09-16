#!/usr/bin/env bash

cd "$(dirname "$0")/.."

if [ ! -d "src" ]; then
    echo "error: 'src/' directory not found."
    exit 1
fi

set -e

check_pacman() {
    if ! command -v pacman &> /dev/null; then
        echo "pacman was not found. This script is intended for Arch-based systems."
        exit 1
    else
        echo "pacman is OK."
    fi
}

check_ruby() {
    if ! command -v ruby &> /dev/null; then
        echo "ruby is not installed. installing Ruby..."
        sudo pacman -S --noconfirm ruby
    else
        echo "ruby is OK."
    fi         
}

check_bundle() {
    if command -v bundle &> /dev/null; then
        local version
        version=$(bundle -v | grep -oP '\d+\.\d+\.\d+')
        if [ "$version" != "2.5.11" ]; then
            echo "bundler version is $version, but 2.5.11 is required. installing the correct version..."
            gem install bundler -v 2.5.11
        else
            echo "bundler 2.5.11 is OK."
        fi
    else
        echo "bundler is not installed. Installing Bundler 2.5.11..."
        gem install bundler -v 2.5.11
    fi
}

if [ ! -f "Gemfile" ]; then
    echo "error: 'Gemfile' not found in the project root directory."
    exit 1
fi

if [ ! -f "Gemfile.lock" ]; then
    echo "warning: 'Gemfile.lock' not found. Installing gems might result in different versions."
fi

check_pacman
check_ruby
check_bundle

echo "installing Ruby gems..."
bundle install

cd src

if [ ! -f "ndle.rb" ]; then
    echo "Error: 'ndle.rb' not found in 'src/' directory."
    exit 1
fi

echo "changing permissions for 'ndle.rb'..."
if ! chmod +x ndle.rb; then
    echo "error: Failed to change permissions for 'ndle.rb'."
    exit 1
fi

echo "current Ruby version:"
ruby -v

echo "running 'ndle.rb'..."
if ! ./ndle.rb; then
    echo "error: 'ndle.rb' failed to execute."
    exit 1
fi
