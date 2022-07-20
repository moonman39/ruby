winning_moves = [
  [[0, 0], [1, 0], [2, 0]],
  [[1, 0], [1, 1], [1, 2]],
  [[2, 0], [2, 1], [2, 2]],
  [[0, 0], [0, 1], [0, 2]],
  [[0, 1], [1, 1], [2, 1]],
  [[0, 2], [1, 2], [2, 2]],
  [[0, 0], [1, 1], [2, 2]],
  [[0, 2], [1, 1], [2, 0]],
]

moves = [[0, 0], [2,2], [1, 0], [2, 0]]


def win_check(winning_moves, moves)
  match_count = 0
  winning_moves.each do |move_set|
    moves.each do |move|
      if move_set.include?(move)
        match_count += 1
        game.game_won = true if match_count = 3
      end
    end
    match_count = 0
  end
end

win_check(winning_moves)