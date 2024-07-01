# welcome message
puts "Needle v1.0.5"
puts "Needle is a project made by DayreaverDoesThings that can do several system operations. Yes, i know, you can just type in the console, but this is my first project!"
puts "This program requires Arch Linux!"
puts "Avalible commands: ls, pwd, sudo pacman -Syu, exit"

loop do
    # ask user for a prompt
    prompt = gets.chomp

    case prompt
    # execute "ls" if prompt = "ls"
    when 'ls'
        system("ls")
    # execute "pwd" if prompt = "pwd"
    when 'pwd'
        system("pwd")
    # execute "sudo pacman -Syu" if prompt = "sudo pacman -Syu"
    when 'sudo pacman -Syu'
        system("sudo pacman -Syu")
    when 'exit'
        puts("exiting needle...")
        exit
    else
        puts("invalid input")
    end
end
