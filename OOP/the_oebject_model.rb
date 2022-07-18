# What are Objects?
# objects are created from classes
# think of classes as molds and objects as things you produce out of those molds
# individual objects will contain different information from other objects, yet they are instances of the same class

"hello".class #=> String
"world".class #=> String


# Classes Define Objects
# think of classes as basic outlines of what an object should be made of and what it should be able to do
# to define a class, we use syntax similar to defining a method

class GoodDog
end
sparky = GoodDog.new()
# sparky is an instance of class GoodDog
# the entire workflow of creating a new object or instance from a class is called instantiation - so we can also say that we've instantiated an object called sparky from the clas GoodDog



# Modules
# a collection of behaviors that is usable in other classes via mixins
# a module is "mixed in" to a class using the include method invocation
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new()
sparky.speak("Arf!") #=> Arf!
bob = HumanBeing.new()
bob.speak("Hello!") #=> Hello!



# Method Lookup
# Ruby has a distinct lookup path that it follows each time a method is called
module Speak
  def speak(Sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors

---GoodDog ancestors---
GoodDog
Speak
Object
Kernel
BasicObject

---HumanBeing ancestors---
HumanBeing
Speak
Object
Kernel
BasicObject



# Exercises
module CatchPhrase
  def speak(hero_name)
    puts "I'm #{hero_name}, and I'm here to save the day!"
  end
end


class SuperHero
  include CatchPhrase
end

superboy = SuperHero.new()
superboy.speak("Super Boy")