puts "Needle v1.0"
puts "Needle is a project made by DayreaverDoesThings that can do several system operations. Yes, i know, you can just type in the console, but this is my first project!"
puts "This program requires Arch Linux!"
puts "Avalible commands: ls, pwd, sudo pacman -Syu"

system("cd ~")

prompt = gets.chomp

if prompt == "ls"
    system("ls")
end
if prompt == "pwd"
    system("pwd")
end
if prompt == "sudo pacman -Syu"
    system("sudo pacman -Syu")
end