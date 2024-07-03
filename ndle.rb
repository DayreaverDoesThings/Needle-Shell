# welcome message
puts "Needle v1.1"
puts "Needle is a command shell project made by DayreaverDoesThings that can execute several system operations."
puts "This program requires Arch Linux!"
puts "Avalible commands: ls, pwd, pacman, cd, mkdir, exit"

loop do
    # ask user for a prompt
    print ">"
    prompt = gets.chomp

    case prompt
    # execute "ls" if prompt = "ls"
    when /^ls/
        system(prompt)
        puts "running \"ls...\""
    # execute "pwd" if prompt = "pwd"
    when /^pwd/
        system(prompt)
        puts "running \"pwd...\""
    # execute "pacman" if prompt = "pacman"
    when /pacman/
        puts "running \"pacman...\""
        system(prompt) 
    # execute "cd" if prompt = "cd" (BROKEN!)
    when /^cd\s+(.+)/
      dir = $1.strip
      begin
        Dir.chdir(dir)
        puts "Changed directory to #{Dir.pwd}"
      rescue Errno::ENOENT
        puts "Directory not found: #{dir}"
      rescue Errno::EACCES
        puts "Permission denied: #{dir}"
      rescue Exception => e
        puts "Error changing directory: #{e.message}"
      end
    # execute "mkdir" if prompt = "mkdir"
    when /mkdir/
        system(prompt)
        puts "running \"ls\"..."
    # exit the program
    when 'exit'
        puts "exiting needle..."
        exit
    # invalid input
    else
        puts "invalid input"
    end
end
