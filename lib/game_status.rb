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

def won?(board)
  board.each_with_index do |space, index|
    puts "Contents: #{space}, Index; #{index}"
  end
end
