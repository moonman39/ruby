# States and Behaviors
# states track attributes for individual objects - tracked by instance variables
# behaviors are what objects are capable of doing - tracked by instance methods



# Initializing a New Object
class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new #=> "This object was initialized!"
# we refer to the initialize method as a constructor, because it is a special method that builds the object when a new object is instantiated



# Instance Variables
# has a @ before it
# a variable that exists as long as the object instance exists and it is one of the ways we tie data to objects
# are responsible for keeping track of information about the state of an object
# every object's state is distinct

class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")



# Instance Methods
class GoodDog
  def initialize(name)
    @name = name
  end
  
  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak #=> Sparky says arf!

fido = GoodDog.new("Fido")
puts fido.speak #=> Fido says arf!



# Accessor Methods
class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def set_name=(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
sparky.set_name = "Spartacus"
puts sparky.get_name

# Setter Method special syntax
# Ruby recognizes that a setter method is a setter method and allows us to use the more natural assignment syntax: sparky.set_name = "Spartacus"
# setter methods always return the value that is passed in as an argument, regardless of what happens inside the method

# Finally, as a convention, Rubyists typically want to name those getter and setter methods using the same name as the instance variable they are exposing and setting
class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name #=> "Sparky"
sparky.name = "Spartacus"
puts sparky.name #=> "Spartacus"



# attr_* methods
# Ruby has a built-in way to automatically create these getter and setter methods for us, using the attr_accessor method
# the attr-accessor metod takes a symbol as an argument, which it uses to create the method name for the getter and setter methods

class GoodDog
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

  def speak
    "#{name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name #=> Sparky
sparky.name = "Spartacus"
puts sparky.name #=> Sparatcus

# if you only want the getter method, use the attr_reader method
# if you only want the setter method, use the attr_writer method
# all of the attr_* methods take Symbol objects as arguments
# if there are more states you're tracking, you can use this syntax:
attr_accessor :name, :height, :weight



# Accessor Methods in Action
def speak
  "#{@name} says arf!"
end
# turns into
def speak
  "#{name} says arf!"
end
# by removing the @ symbol, we're now calling the instance method, rather than the instance variable
# generally a good idea to call the getter method instead of the instance variable


