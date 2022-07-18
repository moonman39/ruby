# Inheritance
# when a class inherits a behavior from another class
# the class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass
# a way to extract common behaviors from classes that share the that behavior, and move it to a superclass



# Class Inheritance
class Animal
  def speak
    puts "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky.GoodDog.new
paws = Cat.new 
puts sparky.speark
puts paws.speak



# Overriding Inheritance
# Ruby checks the object's class first for the method before it looks in the superclass
class Animal
  def speak
    "Hello"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n 
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak #=> Sparky says arf!
puts paws.speak #=> Hello!




# super
# Ruby provides us with the super keyword to call methods earlier in the method lookup path
# when you call super from within a method, it searches the method lookup path for a method with the same name, then invokes it

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak 

# Another more common way of using super is with initialize
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name 
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown") # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear") # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">




# Mixing in Modules
module Swimmable
  def swim 
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end

sparky = Dog.new
neemo = Fish.new
paws = Cat.new

sparky.swim #=> I'm swimming!
neemo.swim #=> I'm swimming!
paws.swim #=> NoMethodError




# Inheriatnce vs Modules
# when to use class inheritance vs mixings
# things to consider:
# you can only subclass (class inheritance) from one class.  You can mix in as many modules (interface inheritance) as you'd like
# if there's an "is-a" relationship, class inheritance is usually the correct choice.  If there's a "has-a" relationship, interface inheritance is generally the better choice
#       for example, a dog "is an" animal and it "has an" ability to swim
# You cannot instantiate modules (i.e., no object can be created from a module).  Modules are used only for namespaces and grouping commong methods together




# Module Lookup Path
# the order in which classes are inspected when you call a method
# the order in which we include modules is important - Ruby looks at the last module we included first 
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming"
  end
end

module Climbable
  def climb 
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

puts "--Animal method lookup--"
puts Animal.ancestors
---Animal method lookup---
Animal
Walkable
Object
Kernel
BasicObject

fido = Animal.new
fido.speak #=> Ruby found the speak method in the Animal class and looked no futher
fido.walk #=> Ruby first looked for the walk instance method in Animal, then looked in the next place according to our list which is the Walkable method
fido.swim #=> Ruby traversed all the classes and modules in the list, and didn't find a swim method, so it threw an error

class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "--GoodDog method lookup--"
puts GoodDog.ancestors
---GoodDog method lookup---
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject





# More Modules

# using modules for namespacing
# organizing similar classes under a module - i.e. grouping related classes
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
# we call classes in a module by appending the class name to the module name with two colons(::)
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak("Arf!") #=> Arf!
kitty.say_name("kitty") #=> "kitty"

# using modules as a container for methods, called module methods
# involves using modules to house other methods
# useful for methods that seem out of place within your code
module Mammal
  ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal.some_out_of_place_method(4)
# or
value = Mammal::some_out_of_place_method(4)




# Private, Protected, and Public
# access modifiers - to allow or restrict access to a particular thing
# in Ruby, the things that we are concerned with restricting access to are the methods defined in a class
#     therefore, will commonly see this concept referred to as Method Access Control
# implemented through the use of the public, private, and protected access modifiers
# private methods are only accessible from other methods in the class

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a 
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

spary = GoodDog.new("Sparky", 4)
sparky.human_years #=> NoMethodError: private method

# in some less common situations, we'll want an in-between approach
# for this, we can use the protected method to create protected methods
#     cannot be invoked outside the class
# main difference between them is that the protected methods allow access between class instances, while private methods do not

class Person
  def initialize(age)
    self.age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader : age
end

malory = Person.new(64)
sterling = Person.new(42)

malory.older?(sterling) #=> true
sterling.older?(malory) #=> false
malory.age #=> NoMethodError: protected method 'age'


# Exercises
class Vehicle
  attr_accessor :year, :color, :make

  @@sub_objects_created = 0

  def self.count_objects
    @@sub_objects_created
  end

  def initialize(year, color, make)
    self.year = year
    self.color = color
    self.make = make
    @current_speed = 0
    @@sub_objects_created += 1
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
end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  
  def initialize(year, color, make)
    super
  end

  def speed_up(speed)
    super(speed)
  end

  def brake(speed)
    super(speed)
  end

  def shut_off
   super
  end

  def spray_paint(color)
    super(color)
  end

  def self.gas_mileage(gallons, miles)
    super(gallons, miles)
  end

  def to_s
    puts "This beautiful #{self.color} #{self.make} was built in #{self.year}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def initialize(year, color, make)
    super
  end

  def speed_up(speed)
    super(speed)
  end

  def brake(speed)
    super(speed)
  end

  def shut_off
   super
  end

  def spray_paint(color)
    super(color)
  end

  def self.gas_mileage(gallons, miles)
    super(gallons, miles)
  end

  def to_s
    puts "This beautiful #{self.color} #{self.make} was built in #{self.year}"
  end
end




class Person
  MAX_HEALTH = 120
  ...
  def heal
    self.health += 1 unless self.health + 1 > MAX_HEALTH
  end
end

class Viking < Person
  ...
  def heal
    2.times { super }
    puts "Ready for battle!"
  end
end