#!/usr/bin/env ruby

require 'rainbow'
require 'logger'
require 'securerandom'
require 'digest'

# create logs directory if it doesn't exist
log_directory = "logs"

# initialize logger and store logs in the logs directory
logfile = File.join(log_directory, 'session.log')
logger = Logger.new(logfile)

# log session start
logger.info("Session started at #{Time.now}")

# display welcome message with details about the needle shell project
if RUBY_PLATFORM =~ /linux/
    puts "needle v1.2.2"
    logger.info("Needle shell v1.2 started")
    puts "needle is a command shell project created by dayreaverdoesthings. it is designed to execute several system-level operations in a streamlined manner."
    puts "this shell is specifically made for arch linux!"
    puts "the following commands are available for use:"
    puts "  - ls: list the contents of the current directory"
    puts "  - pwd: print the current working directory"
    puts "  - pacman: manage packages with the arch linux package manager"
    puts "  - cd: change the current directory"
    puts "  - mkdir: create new directories"
    puts "  - cat: display the contents of a file"
    puts "  - exit: close the needle shell"
    puts "  - help: display this list of commands again"
    puts "  - randomnum: generate a random number"
    puts "  - checksum: generate a md5 or sha256 checksum"
    puts "type 'help' to see this list of commands at any time during your session"

    # Start the loop for the shell commands
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
                puts Rainbow("an error occurred while running ls: #{e.message}").red.bold
                logger.error("Error executing 'ls': #{e.message}")
            end

        when /^pwd/
            puts "executing 'pwd' to display the current directory..."
            begin
                system(prompt)
                logger.info("Executed 'pwd' successfully")
            rescue Exception => e
                puts Rainbow("an error occurred while running pwd: #{e.message}").red.bold
                logger.error("Error executing 'pwd': #{e.message}")
            end

        when /pacman/
            puts "executing 'pacman' for package management..."
            begin
                system(prompt)
                logger.info("Executed 'pacman' successfully")
            rescue Exception => e
                puts Rainbow("an error occurred while running pacman: #{e.message}").red.bold
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
                puts Rainbow("error: directory not found - #{dir}").red.bold
                logger.error("Directory not found: #{dir}")
            rescue Errno::EACCES
                puts Rainbow("error: permission denied - #{dir}").red.bold
                logger.error("Permission denied: #{dir}")
            rescue Exception => e
                puts Rainbow("an error occurred while changing directory: #{e.message}").red.bold
                logger.error("Error changing directory: #{e.message}")
            end

        when /^mkdir\s+(.+)/
            puts "executing 'mkdir' to create a new directory..."
            begin
                system(prompt)
                logger.info("Executed 'mkdir' successfully")
            rescue Exception => e
                puts Rainbow("an error occurred while running mkdir: #{e.message}").red.bold
                logger.error("Error executing 'mkdir': #{e.message}")
            end

        when /cat/
            puts "executing 'cat' to display file contents..."
            begin
                system(prompt)
                logger.info("Executed 'cat' successfully")
            rescue Exception => e
                puts Rainbow("an error occurred while running cat: #{e.message}").red.bold
                logger.error("Error executing 'cat': #{e.message}")
            end

        when 'exit'
            puts "exiting the needle shell..."
            logger.info("Session ended at #{Time.now}")
            logger.close
            Kernel.exit(0)

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
            puts "  - randomnum: generate a random number"
            puts "  - checksum: generate a md5 or sha256 checksum"

        when 'randomnum'
            random_number = SecureRandom.random_number(100)  # Generates a random number between 0 and 99
            puts "Your random number is: #{random_number}"

        when /checksum\s+(\w+)\s+(\S+)$/
            algorithm, file_path = $1.downcase, $2
        
            if File.exist?(file_path)
              file_contents = File.read(file_path)
        
              checksum = case algorithm
                         when 'sha256' then Digest::SHA256.hexdigest(file_contents)
                         when 'md5' then Digest::MD5.hexdigest(file_contents)
                         else
                           puts Rainbow("Unsupported algorithm. Use 'sha256' or 'md5'.").red.bold
                           next
                         end
        
              puts "#{algorithm.upcase} checksum for #{file_path}: #{checksum}"
            else
              puts Rainbow("File not found: #{file_path}").red.bold
            end

        else
            puts Rainbow("Invalid command. Please enter a valid command or type 'help' to see the list of available commands.").yellow.bold
        end  

    end  

else
    puts "this program requires a linux operating system. please try again on a linux system."
    logger.error("Attempted to run on non-Linux system, Exit code 1 - RUNNING_WINDOWS")
    logger.close
    Kernel.exit(1)
end 
