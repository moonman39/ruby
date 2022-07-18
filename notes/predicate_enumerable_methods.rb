# The include? Method
# will return true if the element you pass as an argument to #include? exists in the array or hash
numbers = [5, 6, 7, 8]
numbers.include?(6)
#=> true
numbers.include?(3)
#=> false

friends = %w(Sharon Leo Leila Brian Arun)
invited_list = friends.select { |friend| friend != "Brian" }
invited_list.includes?("Brian") #=> false


# The any? Method
# returns true if any elements in your array or hash match the condition within the block

# The all? Method
# returns true if all of the elements in your array or hash match the condition within the block

# The none? Method
# returns true if none of the elements in your array or hash match the condition within the block