# logic for needle command shell

def exit_shell(logger)
    puts "exiting the needle shell..."
    logger.info("Session ended at #{Time.now}")
    logger.close
    Kernel.exit(0)
end

def display_help
    puts "  - ls: list the contents of the current directory"
    puts "  - pwd: print the current working directory"
    puts "  - pacman: manage packages with the Arch Linux package manager"
    puts "  - cd: change the current directory"
    puts "  - mkdir: create new directories"
    puts "  - cat: display the contents of a file"
    puts "  - exit: close the needle shell"
    puts "  - help: display this list of commands again"
    puts "  - randomnum: generate a random number"
    puts "  - checksum: generate a md5 or sha256 checksum"
end
