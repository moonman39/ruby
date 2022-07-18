# Conditional Statements
# any conditional statement will always have an expression that evaluates to true or false
# based on the answer, the computer will decide whether or not to execute the code that follows



# Truthy and Falsy in Ruby
# the only false values in Ruby are the values nil and false themselves, everything else is considered true



# Basic Conditional Statement
if 1 < 2
  puts "Hot diggity, 1 is less than 2!"
end
# if there is only one like of code to be evaluated inside the block, then you can rewrite the code to be more succinct
puts "Hot diggity damn, 1 is less than 2" if 1 < 2



# Adding else and elsif
if attack_by_land == true
  puts "release the goat"
elsif attack_by_sea == true
  puts "release the shark"
else
  puts "release Kevin the octopus"
end




# #eql?
# checks both the value type and the actual value it holds
5.eql?(5.0) #=> false; one is an integer and another is a float
5.eql?(5) #=> true




# #equal? 
# checks whether both values are the exact same object in memory - this can be slightly confusing because of the way computers store
# some values for efficiency
# two variables pointing to the same number will usually return true
# computers can't store strings in the same efficient way they store numbers
a = 5
b = 5
a.equal?(b) #=> true

a = "hello"
b = "hello"
a.equal?(b) #=> false



# <=> (spaceship operator)
# most commonly used in sorting functions
# returns the following:
# -1 if the value on the left is less than the value on the right;
# 0 if the value on the left is equal to the value on the right;
# 1 if the value on the left is greater than the value on the right
5 <=> 10 #=> -1
10 <=> 10 #=> 0
10 <=> 5 #=> 1



# Case Statements
# a neat way of writing several conditional expressions that would normally result in a messy if..elsif statement
# can even assign the return value from a case statement to a variable for use later
# process each condition in turn, and if the condition returns false, it will move onto the next one until a match is found
# an else clause can be provided to serve as a default if no match is found
grade = "F"

did_i_pass = case grade #=> create a variable "did_i_pass" and assign the result of a call to case with the variable grade passed in
when "A" then "Hell yea!"
when "D" then "Don't tell your mother."
else "'YOU SHALL NOT PASS!' - GANDALF"
end

# if you need to do some more complex code manipulation, you can remove the then keywork and instead place the code to be executed
# on the next line
grade = "F"

case grade
when "A"
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when "D"
  puts "Better luck next time"
  can_i_retire_soon = false
else puts "'YOU SHALL NOT PASS! - Gandalf"
  fml = true
end





# Unless Statements
# an unless statement works in the opposite way as an if statement: it only processes the code in the block if the expression
# evaluates to false
age = 19
unless age < 18
  puts "Get a job"
end

# just like with if statements, you can write a simple unless statement on one line, and you can also add an else clause
age = 19
puts "Welcome to a life of debt" unless age < 18

unless age < 18
  puts "Down with that sort of thing."
else
  puts "Careful now!"
end