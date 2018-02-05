# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #right diagonal
  [2,4,6] #left diagonal
]

board = ["X", "X", "X", "O", " ", "O", " ", " ", " "]
full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]


def won?(board)
  exes = []
  ohs = []
  board.each_with_index do |space, index|
    if space == "X"
      exes << index
    end
    if space == "O"
      ohs << index
    end
  end
  puts "exes: #{exes}"
  puts "ohs: #{ohs}"
  ex_win = WIN_COMBINATIONS.any? do |win_combination|
    exes - win_combination >= 0
  end
  oh_win = WIN_COMBINATIONS.any? do |win_combination|
    ohs - win_combination >= 0 
  end
  if ex_win
    puts "X won!"
    return exes
  elsif oh_win
    puts "Y won!"
    return ohs
  else
    return false
  end
end

def full?(board)
  board.all?{|space| space == "X" || space == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
  puts "full? evaluates to #{full?(board)}"
  puts "!won? evaluates to #{!won?(board)}"
  puts "Both together evaluate to #{full?(board) && !won?(board)}"
end

draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
puts draw?(draw_board) #=> true

x_diagonal_won = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]
puts draw?(x_diagonal_won) #=> false
puts "x_diagonal_won won?: #{won?(x_diagonal_won)}"

incomplete_board = ["X", " ", "X", " ", "X", " ", "O", "O", "X"]
puts draw?(incomplete_board) #=> false
