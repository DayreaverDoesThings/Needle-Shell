# checking ruby version tool
# use for checking the ruby version, and if the rubyversion is incorrect, it installs the correct one
# run this incase you arent sure ruby is installed correct
# THIS IS NOT EXECUTABLE! - I was too lazy to make it executable, so if anyone wants to make it executable, feel free to make a pull request

#!/bin/env bash

# Check if `make` is installed
if ! command -v make &> /dev/null; then
  echo "Error: 'make' is not installed."
  exit 1
fi

make -f rbcheck "$@"
