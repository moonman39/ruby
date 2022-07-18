# Scope
# represents when you can access a variable or method and when you can't
# if your variable is "in scope", then its available for use
# like a cointainer of one-way glass around certain chunks of code
#     inside that container, your variable or method can see (or use) anything in the world outside the container but the outside world can't see in

# A new scope is created when you first define a variable
#   that variable is then accessible by anything "downstream" of it in the code, until the current scope is exited
def launch_longships(longships)
  # Here we can't yet use `longship`, `longships_count` or `longship_name`.  We CAN use `longships` because it was passed in above this point.
  launched_ships = 0
  # Now launched_ships is in scope so we can use it
  longships.each do |longship|
      # Now `longship` is in scope, so we can use it
      longship_name = "#{longship.owner.name}'s Reaver"
      # Now `longship_name` is in scope so we can use it
      longship.launch
      launched_ships += 1
      puts "#{longship_name} successfully launched!"
  end
  # Now we've exited the loop so `longship` and `longship_name` are no longer in scope so we cannot use them.
  puts "Excellent news! We've launched #{launched_ships} ships!"
end

# a good rule of thumb for scope is that you create a new scope any time you should indent your code and any time within that indent a new variable is defined



# private
class Viking < Person
  ...
  def take_damage(damage)
      @health -= damage
      die if @health <= 0
  end
  private
    def die
        puts "#{self.name} has been killed :("
        self.dead = true    # assume we've defined a `dead` instance variable
    end
end



# protected
class Viking < Person
  ...
  def attack(recipient)
      if recipient.dead
          puts "#{recipient.name} is already dead!"
          return false
      end
      damage = (rand * 10 + 10).round(0)
      recipient.take_damage(damage)  # `take_damage` called on `recipient`!
  end
  protected
      def take_damage(damage)
          self.health -= damage
          puts "Ouch! #{self.name} took #{damage} damage and has #{self.health} health left"
          die if @health <= 0  
          # `die` called from within the same object as take_damage was (the `recipient` as well!)
      end
  private
      def die
          puts "#{self.name} has been killed :("
          self.dead = true  # assume we've defined a `dead` instance variable
      end
end

oleg = Viking.create_warrior("Oleg")
#<Viking:0x007ffd4b8b5588 @age=24.58111251562904, @name="Oleg", @health=120, @strength=10, @dead=false> 
sten = Viking.create_warrior("Sten")
=> #<Viking:0x007ffd4b8e1700 @age=28.80998656037281, @name="Sten", @health=120, @strength=10, @dead=false> 
10.times { oleg.attack(sten) }
