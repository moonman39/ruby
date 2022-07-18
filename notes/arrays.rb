# What is an Array?
# an ordered list of elements that can be of any type
array = [1, "Bob", 4.33, "another string"]
array = %w(john david peter)


# Accessing array elements
array.first #=> 1
array.last #=> "another string"
array[2] #=> 4.33



# Modifying Arrays

# #pop
# a method that mutates the caller
# the returned value is the popped element
array.pop #=> "another string"
array #=> [1, "Bob", 4.33]

# #push and <<
# mutate the caller, so the original array is modified
# the return value is the array
array.push("another string") #=> [1, "Bob", 4.33, "another string"]
array << 5 #=> [1, "Bob", 4.33, "another string", 5]

# #shift and unshift
# mutate the caller
users.unshift("robert") #Adds an element in front of the array, returns the array
users.shift # Removes the first element of the array and returns the removed element




# Converting an Array into a String, or vice versa

# #join
letters = %w(a b c d)
letters.join #=> "abcd"
letters.join #=> "a b c d"

# #split
"a b c".split #=> ["a", "b", "c"]




# Slicing an Array
# Take elements from the array, without changing it
numbers = [1, 2, 3, 4, 5]
numbers.take(3) #=> [1, 2, 3]
numbers[0, 3] #=> [1, 2, 3]
numbers[1, 3] #=> [2, 3, 4]
numbers[1..-1] #=> [2, 3, 4, 5]




# Array Methods

# the #map method
# iterates over an array applying a block to each element of the array and returns a new array with those results
# not a destructive method
a = [1, 2, 3, 4]
a.map { |number| number**2 }  #=> [1, 4, 9, 16]
a #=> [1, 2, 3, 4]

a = [1, 2, 3]
a.map { |x| puts x**2 } #=> [nil, nil, nil]

# the #delete_at method
# if you'd like to eliminate the value at a certain index from your array
# modifies the array destructively
# returns the deleted element
a = [1, 2, 3, 4]
a.delete_at(1) #=> 2
a #=> [1, 3, 4]

# the #delete method
# permanently deletes all instances of the provided value from the array
my_pets = %w(cat dog bird cat snake)
my_pets.delete("cat") #=> "cat"
my_pets #=> ["dog", "bird", "snake"]

# the #uniq method
# iterates through an array, deletes any duplicate values, then returns the result as a new array
# does not mutate the caller
b = [1, 1, 2, 2, 3, 3, 4, 4]
b.uniq #=> [1, 2, 3, 4]
b #=> [1, 1, 2, 2, 3, 3, 4, 4]

# #include?
# checks to see if the argument given is included in the array
# has a question mark at the end which usually means that you should expect it to return a boolean value
a = [1, 2, 3, 4, 5]
a.include?(3) #=> true
a.include?(6) #=> false

# #flatten
# can be used to take an array that contains nested arrays and create a one-dimensional array
# not a destructive method
a = [1, 2, [3, 4, 5], [6, 7]]
a.flatten #=> [1, 2, 3, 4, 5, 6, 7]

# #each
# iterates over a collection, runs the code in the block once for each element, and returns the collection it was invoked on
a = [1, 2, 3]
a.each { |e| puts e } #=> [1, 2, 3]

# #each_index
# iterates through the array much like the each method; however, the variable represents the index number as opposed to the value
# the original array is returned
a = [1, 2, 3, 4, 5]
a.each_index { |i| puts "This is the index #{i}" } #=> [1, 2, 3, 4, 5]

# #each_with_index
# gives us the ability to manipulate both the value and the index by passing in two parameters to the block of code
a = [1, 2, 3, 4, 5]
a.each_with_index { |value, index| puts "#{index + 1}. #{value}" } #=> [1, 2, 3, 4, 5]

# #sort
# returns a sorted array
# not a destructive method
a = [5, 3, 8, 2, 4, 1]
a.sort #=> [1, 2, 3, 4, 5, 8]
a #=> [5, 3, 8, 2, 4, 1]

# #product
# returns an array this is a combination of all elements from all arrays
[1, 2, 3].product([4, 5]) #=> [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]


# Iterating Over an Array

# the #select method
# iterates over an array and returns a new array that includes any items that return true to the expression provided
# does not mutate the caller
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers.select { |number| number > 4 } #=> [5, 6, 7, 8, 9, 10]
numbers #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]



# Methods With a !
# the bang suffix ( ! ) at the end of the method name usually indicates that the method will change the caller permanently
# not always the case, however



# Nested Arrays
teams = [['Joe', 'Steve'], ['Frank', 'Molly'], ['Dan', 'Sara']]

# Accessing Nested Elements
teams[1] #=> ["Frank", "Molly"]
teams[1][1] #=> "Molly"
teams.last.first #=> "Dan"




# Comparing Arrays

# the equality == operator
a = [1, 2, 3]
b = [2, 3, 4]
a == b #=> false
b.pop #=> 4
b.unshift(1) #=> [1, 2, 3]
a == b #=> true



# to_s
# used to create a string representation of an array
# Ruby does this behind the scenes
a = [1, 2, 3]
"Its as easy as #{a}" #=> "Its as easy as [1, 2, 3]"
