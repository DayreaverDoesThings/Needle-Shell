# welcome message
# please credit when using this please
if RUBY_PLATFORM =~ /linux/
    puts "Needle v1.1.5"
    puts "Needle is a command shell project made by DayreaverDoesThings that can execute several system operations."
    puts "This program requires Arch Linux!"
    puts "Avalible commands:"
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
        # execute "ls" if prompt = "ls"
        when /^ls/
            puts "running \"ls...\""
            system(prompt)
        # execute "pwd" if prompt = "pwd"
        when /^pwd/
            puts "running \"pwd...\""
            system(prompt)
        # execute "pacman" if prompt = "pacman"
        when /pacman/
            puts "running \"pacman...\""
            system(prompt) 
        # execute "cd" if prompt = "cd" (BROKEN!)
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
        # execute "mkdir" if prompt = "mkdir"
        when /^mkdir\s+(.+)/
            puts "running \"mkdir\"..."
            system(prompt)
        # exit the program
        when 'exit'
            puts "exiting needle..."
            exit
        # help
        when 'help'
            puts "showing help..."
            puts "Avalible commands:"
            puts "ls"
            puts "pwd"
            puts "pacman"
            puts "cd"
            puts "mkdir"
            puts "exit"
            puts "help"
            puts "Type \"help\" for another list of commands"
        # execute "cat" if prompt = "cat"
        when /cat/
            puts "running \"cat...\""
            system(prompt)
        # invalid input
        else
            puts "invalid input"
        end
    end
else
    puts "This program requires linux, please try again on a linux system."
    exit
end
