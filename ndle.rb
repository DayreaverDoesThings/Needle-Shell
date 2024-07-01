# welcome message
puts "Needle v1.0.6"
puts "Needle is a project made by DayreaverDoesThings that can do several system operations. Yes, i know, you can just type in the console, but this is my first project!"
puts "This program requires Arch Linux!"
puts "Avalible commands: ls, pwd, pacman, exit"

loop do
    # ask user for a prompt
    print ">"
    prompt = gets.chomp

    case prompt
    # execute "ls" if prompt = "ls"
    when /^ls/
        system(prompt)
    # execute "pwd" if prompt = "pwd"
    when /^pwd/
        system(prompt)
    # execute "pacman" if prompt = "sudo pacman -Syu"
    when /pacman/
        system(prompt)
    when 'exit'
        puts("exiting needle...")
        exit
    else
        puts("invalid input")
    end
end
