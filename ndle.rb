#!/usr/bin/env ruby

require 'logger'

# create logs directory if it doesn't exist
log_directory = "logs"

# initialize logger and store logs in the logs directory
logfile = File.join(log_directory, 'session.log')
logger = Logger.new(logfile)

# log session start
logger.info("Session started at #{Time.now}")

# display welcome message with details about the needle shell project
if RUBY_PLATFORM =~ /linux/
    puts "needle v1.2"
    logger.info("Needle shell v1.2 started")
    puts "needle is a command shell project created by dayreaverdoesthings. it is designed to execute several system-level operations in a streamlined manner."
    puts "this shell is specifically made for arch linux!"
    puts "the following commands are available for use:"
    puts "  - ls: list the contents of the current directory"
    puts "  - pwd: print the current working directory"
    puts "  - pacman: manage packages with the arch linux package manager"
    puts "  - cd: change the current directory (this command has limited functionality)"
    puts "  - mkdir: create new directories"
    puts "  - cat: display the contents of a file"
    puts "  - exit: close the needle shell"
    puts "  - help: display this list of commands again"
    puts "type 'help' to see this list of commands at any time during your session"

    loop do
        # prompt the user to enter a command
        print "#{Dir.pwd}>"
        prompt = gets.chomp
        logger.info("Command entered: #{prompt}")

        next if prompt.strip.empty?
    
        case prompt
        when /^ls/
            puts "executing 'ls' to list directory contents..."
            begin
                system(prompt)
                logger.info("Executed 'ls' successfully")
            rescue Exception => e
                puts "an error occurred while running ls: #{e.message}"
                logger.error("Error executing 'ls': #{e.message}")
            end
        when /^pwd/
            puts "executing 'pwd' to display the current directory..."
            begin
                system(prompt)
                logger.info("Executed 'pwd' successfully")
            rescue Exception => e
                puts "an error occurred while running pwd: #{e.message}"
                logger.error("Error executing 'pwd': #{e.message}")
            end
        when /pacman/
            puts "executing 'pacman' for package management..."
            begin
                system(prompt)
                logger.info("Executed 'pacman' successfully")
            rescue Exception => e
                puts "an error occurred while running pacman: #{e.message}"
                logger.error("Error executing 'pacman': #{e.message}")
            end
        when /^cd\s+(.+)/
            puts "attempting to change directory with 'cd'..."
            dir = $1.strip
            begin
                Dir.chdir(dir)
                puts "successfully changed directory to #{Dir.pwd}"
                logger.info("Changed directory to #{Dir.pwd}")
            rescue Errno::ENOENT
                puts "error: directory not found - #{dir}"
                logger.error("Directory not found: #{dir}")
            rescue Errno::EACCES
                puts "error: permission denied - #{dir}"
                logger.error("Permission denied: #{dir}")
            rescue Exception => e
                puts "an error occurred while changing directory: #{e.message}"
                logger.error("Error changing directory: #{e.message}")
            end
        when /^mkdir\s+(.+)/
            puts "executing 'mkdir' to create a new directory..."
            begin
                system(prompt)
                logger.info("Executed 'mkdir' successfully")
            rescue Exception => e
                puts "an error occurred while running mkdir: #{e.message}"
                logger.error("Error executing 'mkdir': #{e.message}")
            end
        when /cat/
            puts "executing 'cat' to display file contents..."
            begin
                system(prompt)
                logger.info("Executed 'cat' successfully")
            rescue Exception => e
                puts "an error occurred while running cat: #{e.message}"
                logger.error("Error executing 'cat': #{e.message}")
            end
        when 'exit'
            puts "exiting the needle shell..."
            logger.info("Session ended at #{Time.now}")
            logger.close
            exit(0)
        when 'help'
            puts "displaying the list of available commands..."
            logger.info("Displayed help")
            puts "  - ls: list the contents of the current directory"
            puts "  - pwd: print the current working directory"
            puts "  - pacman: manage packages with the arch linux package manager"
            puts "  - cd: change the current directory"
            puts "  - mkdir: create new directories"
            puts "  - cat: display the contents of a file"
            puts "  - exit: close the needle shell"
            puts "  - help: display this list of commands again"
        else
            puts "invalid input. please enter a valid command or type 'help' to see the list of available commands."
            logger.warn("Invalid command entered: #{prompt}")
        end
    end
else
    puts "this program requires a linux operating system. please try again on a linux system."
    logger.error("Attempted to run on non-Linux system, Exit code 1 - RUNNING_WINDOWS")
    logger.close
    Kernel.exit(1)
end
