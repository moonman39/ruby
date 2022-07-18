# Class Methods
# methods we can call directly on the class itself, without having to instantiate any objects
# where we put functionality that does not pertain to individual objects

def self.what_am_i
  "I'm a GoodDog class!"
end

GoodDog.what_am_i


# Class Variables
# are created using two @@ symbols

class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs #=> 0
dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs #=> 2



# Constants
# when creating classes, there may also be certain variables that you never want to change
# defined by using an upper case letter at the beginning of the variable name
# most Rubyists will make the entire variable uppercase

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age #=> 28



# The to_s Method
# commes built-in to every class in Ruby

puts sparky # => #<GoodDog:0x007fe542323320>
# the puts method automatically calls to_s on its argument
# puts sparky is the equivalent of puts sparky.to_s
# by default, the to_s method returns the name of the object's class and an encoding of the object ID

# overriding the to_s Method
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end
puts sparky # => This dog's name is Sparky and is 28 in dog years.

# besides being called automatically when using puts, another important attribute of the to_s method is that it's also 
# automatically called in string interpolation
"#{sparky}" #=> "This dog's name is Sparky and it is 28 in dog years."
# equivalent to calling sparky.to_s




# More About Self
# self can refer to different things depending on where it is used
# two clear use cases for self so far
# 1. use self when calling setter methods from within the class
# 2. use self for class method definitions

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w 
  end

  def change_info(n, h, w)
    self.name = n 
    self.height = h 
    self.weight = w
  end

  def info
    "#{self.name} weight #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end

  # using self inside a class but outside an instance method refers to the class itself
  # therefore, a method definition prefixed with self is the same as defining the method on the class
  puts self
end

# when self is prepended to a method definition, it is defining a class method
class MyAwesomeClass
  def self.this_is_a_class_method
  end
end

# For Final Clarification:
# 1. self, inside of an instance method, references the instance (object) that called the method - the calling object.  Therefore, self.weight= is the same as sparky.weight=
# 2. self, outside of an instance method, references the class and can be used to define class methods.  Therefore, if we define a name lass method, def self.name=(n) is the same as def GoodDog.name=(n)




# Exercises
class MyCar
  attr_accessor :year, :color, :make

  def initialize(year, color, make)
    self.year = year
    self.color = color
    self.make = make
    @current_speed = 0
  end

  def speed_up(speed)
    @current_speed += speed
    puts "The car is currently going #{@current_speed}."
  end

  def brake(speed)
    @current_speed -= speed
    if @current_speed < 0
      puts "The car is going in reverse at #{@current_speed} mph."
    else
      puts "The car is going #{@current_speed} mph."
    end
  end

  def shut_off
    @current_speed = 0
    puts "The car is turned off."
  end

  def spray_paint(color)
    self.color = color
    puts "The new #{color} paint looks awesome!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    puts "This beautiful #{self.color} #{self.make} was built in #{self.year}"
end