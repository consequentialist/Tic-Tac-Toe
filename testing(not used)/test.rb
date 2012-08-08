class John
puts"hello"
def ask_name
print "What is your name? "
name = gets.chomp
puts "Hello #{name}!"
end
John.new.ask_name

end