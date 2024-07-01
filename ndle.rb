# welcome message
puts "Needle v1.0"
puts "Needle is a project made by DayreaverDoesThings that can do several system operations. Yes, i know, you can just type in the console, but this is my first project!"
puts "This program requires Arch Linux!"
puts "Avalible commands: ls, pwd, sudo pacman -Syu"

# ask user for a prompt
prompt = gets.chomp

# execute "ls" if prompt = "ls"
if prompt == "ls"
    system("ls")
end
# execute "pwd" if prompt = "pwd"
if prompt == "pwd"
    system("pwd")
end
# execute "sudo pacman -Syu" if prompt = "sudo pacman -Syu"
if prompt == "sudo pacman -Syu"
    system("sudo pacman -Syu")
end
