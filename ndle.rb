# welcome message
# please credit when using this please
if RUBY_PLATFORM =~ /linux/
    puts "Needle v1.2"
    puts "Needle is a command shell project made by DayreaverDoesThings that can execute several system operations."
    puts "This program requires Arch Linux!"
    puts "Available commands:"
    puts "ls"
    puts "pwd"
    puts "pacman"
    puts "cd"
    puts "mkdir"
    puts "cat"
    puts "exit"
    puts "help"
    puts "Type \"help\" for another list of commands"

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
            puts "showing help..."
            puts "Available commands:"
            puts "ls"
            puts "pwd"
            puts "pacman"
            puts "cd"
            puts "mkdir"
            puts "exit"
            puts "help"
            puts "Type \"help\" for another list of commands"
        # invalid input
        else
            puts "invalid input"
        end
    end
else
    puts "This program requires linux, please try again on a linux system."
    exit
end
