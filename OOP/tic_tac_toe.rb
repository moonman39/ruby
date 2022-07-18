module Gameplay
  def get_moves
    puts "#{self.name.capitalize}, enter the row"
    row = gets.chomp.to_i
    puts "#{self.name.capitalize}, enter the column"
    column = gets.chomp.to_i
    self.current_move.push(row, column)
  end
  
  def player_move(game)
    game.gameboard[self.current_move[0]][self.current_move[1]] = self.icon
    self.moves.push(self.current_move)
    self.current_move = []
    game.print_gameboard
  end

  def win_check(game)
    game.winning_moves.each do |array|
      if self.moves.sort == array
        game.game_won = true
      end
    end
  end
end



class Player
  attr_accessor :name, :moves, :current_move, :icon

  @@player_count = 0
  
  def initialize(name)
    @name = name
    if @@player_count > 0
      @icon = "o"
    else
      @icon = "x"
    end
    @moves = []
    @current_move = []
    @@player_count += 1
  end

  include Gameplay
end



class Game
  attr_accessor :gameboard, :winning_moves, :game_won

  def initialize
    @gameboard = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]
    @winning_moves = [
      [[0, 0], [1, 0], [2, 0]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      [[0, 0], [0, 1], [0, 2]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]],
    ]
    @game_won = false
  end


  def print_gameboard
   @gameboard.each { |array| puts array.join(" | ")}
  end

  def play_game(player_1, player_2)
    loop do
      player_1.get_moves
      player_1.player_move(self)
      player_1.win_check(self)
      if self.game_won == true
        puts "#{player_1.name} won!"
        break
      end
      
      player_2.get_moves
      player_2.player_move(self)
      player_2.win_check(self)
      if self.game_won == true
        puts "#{player_1.name} won!"
        break
      end
    end
  end

end



# Initialize Players
puts "Player one, please enter your name"
player_1 = gets.chomp
player_1 = Player.new(player_1.downcase)
puts "Player two, please enter your name"
player_2 = gets.chomp
player_2 = Player.new(player_2.downcase)

# Create Gameboard
game_one = Game.new
game_one.print_gameboard


# Play a Game
game_one.play_game(player_1, player_2)
