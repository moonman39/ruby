# What is a hash?
# a data structure that stores items by associated keys
# entries in a hash are often referred to as key-value pairs
# created by using symbols as keys and any data types as values



# Creating a hash

# older syntax
old_syntax_hash = {:name => "bob"} #=> {:name => 'bob}

# newer syntax
new_syntax_hash = {name: "bob"} #=> {:name =>'bob}
person = { height: '6 ft', weight: '160 lbs' }




# Modifying Hashes

# Adding on to an existing hash
person = { height: '6 ft', weight: '160 lbs' }
person[:hair] = 'brown' #=> 'brown'
person #=> {:height=>'6 ft', :weight=>'160 lbs', :hair=>'brown'}
person[:age] = 62
person #=> {:height=>'6 ft', :weight=>'160 lbs', :hair=>'brown', :age=>62}

# Removing a key/value pair from a hash
person.delete(:age) #=> 62
person #=> {:height=>'6 ft', :weight=>'160 lbs', :hair=>'brown'}

# Accessing hash information
person[:weight] #=> "160 lbs"

# Merging two hashes together
person.merge!(new_syntax_hash) #=> {:height=>'6 ft', :weight=>'160 lbs', :hair=>'brown', :name=>'bob'}






# Iterating Over Hashes
# similar to iterating over arrays
person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}
person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end





# Hashes as Optional Parameters
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]} years old and I live in #{options[:city]}"
  end
end

greeting('Bob')
greeting('Bob', {age: 62, city: "New York City"})
# you can also pass in arguments to the greeting method like this:
greeting("Bob", age: 62, city: "New York City")
# curly braces are not required when a hash is the last argument




# Common Hash Methods

# key? & value?
# allows you to check if a hash contains a specific key
# returns a boolean value
name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
name_and_age.key?("Steve") #=> true
name_and_age.key?("Larry") #=> false
name_and_age.value?(42) #=> true
name_and_age.value?(100) #=> false

# select
# allows you to pass a block and return any key-value pairs that evaluate to true when passed to the block
name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
name_and_age.select { |k,v| k == "Bob" } #=> {"Bob" => 42}
name_and_age.select { |k, v| (k == "Bob") || (v == 19) } #=> => {"Bob"=>42, "Joe"=>19}

# fetch
# allows you to pass a given key and it will return the value for that key if it exists
# can also specify an option for return if that key is not present
name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
name_and_age.fetch("Steve") #=> 31
name_and_age.fetch("Larry") #=> key not found
name_and_age.fetch("Larry", "Larry isn't in this hash") #=> "Larry isn't in this hash"

# to_a
# returns an array version of your hash when called
# doesn't modify the hash permanently
name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
name_and_age.to_a #=> [["Bob", 42], ["Steve", 31], ["Joe", 19]]
name_and_age #=> { "Bob" => 42, "Steve" => 31, "Joe" => 19}

# keys and values
name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
name_and_age.keys #=> ["Bob", "Steve", "Joe"]
name_and_age.values #=> [42, 31, 19]
# returned values are in array format, so you can do interesting things like:
name_and_age.values.each { |v| puts v }



family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

