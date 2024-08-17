# welcome message
# please credit when using this please
if RUBY_PLATFORM =~ /linux/
  puts "needle v1.2"
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
    puts "type 'help' to see this list of commands at any time during your session"

    loop do
        # ask user for a prompt
        print "#{Dir.pwd}>"
        prompt = gets.chomp
    
        case prompt
        # execute "ls" with error handling
        when /^ls/
            puts "running \"ls...\""
            begin
                system(prompt)
            rescue Exception => e
                puts "error running ls: #{e.message}"
            end
        # execute "pwd" with error handling
        when /^pwd/
            puts "running \"pwd...\""
            begin
                system(prompt)
            rescue Exception => e
                puts "error running pwd: #{e.message}"
            end
        # execute "pacman" with error handling
        when /pacman/
            puts "running \"pacman...\""
            begin
                system(prompt)
            rescue Exception => e
                puts "error running pacman: #{e.message}"
            end
        # execute "cd" with error handling
        when /^cd\s+(.+)/
            puts "running \"cd...\""
            dir = $1.strip
            begin
                Dir.chdir(dir)
                puts "changed directory to #{Dir.pwd}"
            rescue Errno::ENOENT
                puts "directory not found: #{dir}"
            rescue Errno::EACCES
                puts "permission denied: #{dir}"
            rescue Exception => e
                puts "error changing directory: #{e.message}"
            end
        # execute "mkdir" with error handling
        when /^mkdir\s+(.+)/
            puts "running \"mkdir\"..."
            begin
                system(prompt)
            rescue Exception => e
                puts "error running mkdir: #{e.message}"
            end
        # execute "cat" with error handling
        when /cat/
            puts "running \"cat...\""
            begin
                system(prompt)
            rescue Exception => e
                puts "error running cat: #{e.message}"
            end
        # exit the program
        when 'exit'
            puts "exiting needle..."
            exit
        # help
        when 'help'
            puts "displaying the list of available commands..."
            puts "  - ls: list the contents of the current directory"
            puts "  - pwd: print the current working directory"
            puts "  - pacman: manage packages with the arch linux package manager"
            puts "  - cd: change the current directory"
            puts "  - mkdir: create new directories"
            puts "  - cat: display the contents of a file"
            puts "  - exit: close the needle shell"
            puts "  - help: display this list of commands again"
        # invalid input
        else
            puts "invalid input. please enter a valid command or type 'help' to see the list of available commands."
        end
    end
else
    puts "this program requires linux, please try again on a linux system."
    exit
end
