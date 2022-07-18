class Viking
  def initialize(name, health, age, strength)
    @name = name
    @health = health
    @age = age
    @strength = strength
  end

  def self.create_warrior(name)
    age = rand * 20 * 15
    health = [age * 5, 120].min
    strength = [age / 2, 10].min 
    Viking.new(name, health, age, strength)
  end

  def self.random_name
    ["Grant", "James", "Raye", "Ashley"].sample
  end
end

grant = Viking.create_warrior(Viking.random_name)
james = Viking.create_warrior(Viking.random_name)