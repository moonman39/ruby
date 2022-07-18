# Enumerable Methods
# convenient built-in methods that are includes as part of both arrayds and hashes
# iteration patterns that will be repeated such as transforming, searching for, and selecting subsets of elements in collections

# Life Before Enumerables
friends = %w(Sharon Leo Leila Brian Arun)
invited_list = []

for friend in friends do
  if friend != "Brian"
    invited_list.push(friend)
  end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]

# #select method
# are able to change the above code to this:
friends = %w(Sharon Leo Leila Brian Arun)
friends.select { |friend| friend != "Brian" }


# #reject method
friends = %w(Sharon Leo Leila Brian Arun)
friends.reject { |friend| friend == "Brian" }


# The #each Method
# will iterate through an array and will yield each element to the code black, where a task can be performed
# will return the original array or hash regardless of what happens inside the code block
friends = %w(Sharon Leo Leila Brian Arun)
friends.each { |friend| puts "Hello, #{friend}" }
#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun
#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]
my_array [1, 2]
my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end
#=> The new number is 2.
#=> The new number is 4.
#=> [1, 2]


# #each with hashes
# by default, each iteration will yield both the key and the value individually or together (as an array) to the block depending on how you define your block variable
my_hash = { "one" => 1, "two" => 2 }
my_hash.each { |key, value| puts "#{key} is #{value}" }
one is 1
two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }
the pair is ["one", 1]
the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}


# The #each_with_index Method
# nearly the same as #each, but yields two block variables instead of one as it iterates through an array
# the first variable is the element itself, while the second variable's value is the index of the element within the array
# returns the original array it's called on
fruits = %w(apple banana strawberry pineapple)
fruits.each_with_index{ |fruit, index| puts fruit if index.even? }


# The #map Method
# transforms each element from an array according to whatever block you pass to it and returns the transformed elements in a new array
friends = %w(Sharon Leo Leila Brian Arun)
friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
my_order.map { |item| item.gsub("medium", "extra-large") }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]

salaries = [1200, 1500, 1100, 1800]
salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]


# the #select Method
# passes every item in an array to a block and returns a new array with only the items for which the condition you set in the block evaluates to true
friends = %w(Sharon Leo Leila Brian Arun)
friends.select { |friend| friend != "Brian" }
 #=> ["Sharon", "Leo", "Leila", "Arun"]

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
friends.select { |friend, response| response == "yes" }
#=> {"Sharon"=>"yes", "Arun"=>"yes"}


# The #reduce Method
# reduces an array or hash down to a single object
# should use it when you want to get an output of a single value
my_numbers = [5, 6, 7, 8]
my_numbers.reduce { |sum, number| sum + number }
#=> 26
# sum (in this example) is the accumulator
# the result of each iteration is stored in the aaccumulator and then passed to the next iteration
# the accumulator is also the value that the #reduce method returns at the end of its work
# by default, the initial value of thea accumulator is the first element in the collection
# can set a different initial value for the accumulator by directly passing in a value to the #reduce method
my_numbers = [5, 6, 7, 8]
my_numbers.reduce(1000) { |sum, number| sum + number }
#=> 1026

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]
votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}

min_number = [65, 3, 100, 42, -7]
min_number.reduce do |min_num, num|
  min_num = min_num > num? num : min_num
end


# Return Values of Enumerables
# if it's not a good idea to use bang methods but we need to re-use the result of an enumerable method, what can we do instead?
# one option is to put the result into a local variable
friends = %w(Sharon Leo Leila Brian Arun)
invited_friends = friends.select { |friend| friend != "Brian" }
friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_friends
#=> ["Sharon", "Leo", "Leila", "Arun"]
# an even better option would be to wrap your enumerable method in a method definition
friends = %w(Sharon Leo Leila Brian Arun)
def invited_friends(friends)
  friends.select { |friend| friend != "Brian" }
end
friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_friends(friends)
 #=> ["Sharon", "Leo", "Leila", "Arun"]
