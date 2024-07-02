# welcome message
puts "Needle v1.1"
puts "Needle is a command shell project made by DayreaverDoesThings that can execute several system operations. 
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
    # execute "pwd" if prompt = "pwd"
    when /^pwd/
        system(prompt)
    # execute "pacman" if prompt = "pacman"
    when /pacman/
        system(prompt) 
    # execute "cd" if prompt = "cd"
    when /cd/
        system(prompt)
    # execute "md" if prompt = "md"
    when /mkdir/
        system(prompt)
    # exit the program
    when 'exit'
        puts("exiting needle...")
        exit
    # invalid input
    else
        puts("invalid input")
    end
end
