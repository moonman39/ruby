# A Simple Loop
# takes a block and will execute any code within the block until you manually intervene with ctrl + c or insert a break statement
# loop do
#   puts "This will keep printing until you hit Ctrl + c"
# end




# Controlling Loop Execution
i = 0
loop do
  i += 1
  puts i
  break
end
# the break keyword allows us to exit a loop at any point, so any code after a break will not be executed




# Adding contitions within a loop
i = 0
loop do
  i += 2
  puts i
  break if i == 10
end



# The next keyword
# used to skip the rest of the current iteration and start executing the next iteration
i = 0
loop do
  i += 2
  next if i == 4
  puts i
  break if i == 10
end



# While Loops
# given a parameter that evaluates as either true or false - once that expression becomes false, the while loop is not executed again
x = gets.chomp.to_i

while x >= 0
  puts x
  x -= 1
end

puts "Done!"

# while loops do not have its own scope - the entire body of the loop is in the same scope as the code that contains the while loop
x = 0
while x < 5
  y = x * x
  x += 1
end

puts y # 16




# Until Loops
# simply the opposite of the while loop
x = gets.chomp.to_i

until x < 0
  puts x
  x -= 1
end

puts "Done!"

# As with while loops, until is not a method - therefore, until loops do not have their own scope




# Do/While Loops
# works in a similar way to a while loop; one important difference is that the code within the loop gets executed one time,
# prior to the conditional check to see if the code should be executed
# the conditional check is placed at the end of the loop as opposed to the beginning
# Ruby doesn't have a built-in "do/while" loop - have to use loop and break to emulate its behavior
loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  break if answer != "Y"
end





# Ranges
(1..5) # inclusive range: 1, 2, 3, 4, 5
(1...5) # exclusive range: 1, 2, 3, 4
# can make ranges of letters, too
('a'..'d') # a, b, c, d



# For Loops
# used to loop over a collection of elements
# have a definite end since it's looping over a finite number of elements
x = gets.chomp.to_i

for i in 1..x do
  puts x - 1
end

puts "Done!"
# the odd thing about the for loop is that the loop returns the collection of elements after it executes, whereas the earlier loop
# examples return nil
x = [1, 2, 3, 4, 5]

for i in x.reverse do
  puts i
end

puts "Done!"

# As with while and until loops, for is not implemented as a method.  Therefore, a for loop does not have its own scope



# Conditionals Within Loops
x = 0

while x <= 10
  puts x if x.odd?
  x += 1
end

x = 0
while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end




# Times Loop
# iterates through a loop a specified number of times
# accesses the number its currently iterating through
5.times { puts "Hello, world!" }

5.times { |number| puts "Alternative fact number #{number}" }
# loops will start counting from a zero index unless specified otherwise




# Upto and Downto Loops
5.upto(10) { |number| print "#{number} " }
10.downto(5) { |number| print "#{number " }