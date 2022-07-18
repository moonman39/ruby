# Default Parameters
def say(words = "hello")
  puts words + '.'
end
say()
say("hi")




# Method Definition and Local Variable Scope
# a method definition creates its own scope outside the regular flow of execution
# local variables within a method definition cannot be referenced from outside of the method definition
# local variables within a method definition cannot access data outside of the method definition (unless the data is passed in as an argument)
a = 5
def some_method
  a = 3
end
puts a #=> 5



# Mutating the Caller
# sometimes when calling a method, the argument can be altered permanently (mutating the caller)
a = [1, 2, 3]
def mutate(array)
  array.pop
end

mutate(a)



# puts vs return
# in Ruby, every method returns the evaluated result of the last line that is executed
a = [1, 2, 3]
def mutate(array)
  array.pop
end
p "Before mutate method: #{a}" #=> "Before mutate method: [1, 2, 3]""
p mutate(a) #=> 3
p "After mutate method: #{a}" #=> "After mutate method: [1, 2]""

def add_three(number)
  number + 3
end
returned_value = add_three(4) #=> 7
puts returned_value #=> nil

def add_three(number)
  return number + 3
  number + 4
end
returned_value = add_three(4) #=> 7
puts returned_value #=> nil




# Chaining Methods
def add_three(n)
  n + 3
end
add_three(5) #=> 8
# since add_three returns a value, we can then keep calling methods on the returned value
add_three(5).times { puts "this should print 8 times" }



# Method Calls as Arguments
def add(a, b)
  a + b
end

def subtract(a, b)
  b - a
end

def multiply(num1, num2)
  num1 * num2
end

add(20, 45)
=> 65
# returns 65

subtract(80, 10)
=> 70
# returns 70

multiply(add(20, 45), subtract(80, 10))
=> 4550
# returns 4550

add(subtract(80, 10), multiply(subtract(20, 6), add(30, 5)))
=> 560





# Predicate Methods
# methods that return a Boolean

# even?
puts 5.even?

# odd?
puts 5.odd?

# between?
puts 12.between?(10, 15)
