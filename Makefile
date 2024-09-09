# Makefile for Ruby project

# Define Ruby version
RUBY_VERSION = 3.1.0

# Default target
all: check_ruby_version

# Check Ruby version
check_ruby_version:
	@ruby_version=$$(ruby -v | awk '{print $$2}' | cut -d'p' -f1); \
	if [ "$$ruby_version" != "$(RUBY_VERSION)" ]; then \
	  echo "Error: Ruby version $(RUBY_VERSION) required but found $$ruby_version."; \
	  exit 1; \
	fi
