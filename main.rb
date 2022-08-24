PLAYER_ONE = "X"
PLAYER_TWO = "O"
WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]

def initialize_board
  @count = 0
  @current_player = PLAYER_ONE
  @board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  @game_over = false
end

def display_board(board)
  puts ""
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts ""
end


def start_game
  puts "Welcome to my 2 player Tic Tac Toe game."
  puts "Player 1 will be X and Player 2 will be O."
  puts "Select any available number from the grid to place your piece."
end

def place_piece
  begin
    print "#{@current_player}, select your placement: "
    input = gets.chomp.to_i
    return false if(input == 999)
    if(!valid = valid_move(input))
      puts "That spot is taken, pick another: "
    end
  end while(!valid)
  input
end

def valid_move(input)
  @board[input -1] != "X" || "O"
end

def update_board(input)
  @board[input -1] = @current_player
end

def play
  input = place_piece
  return false if !input
  update_board(input)
  display_board(@board)
end

def switch_player
  if(@current_player == PLAYER_ONE)
    @current_player = PLAYER_TWO
  else
    @current_player = PLAYER_ONE
  end
end

def turn_count
  @count = @count + 1
  if @count >= 9
    @game_over = true
    puts "Game Over, it's a draw"
  end
end

def won_game
  WIN_COMBINATIONS.any? do |combo|
    if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      @game_over = true
      puts "#{@current_player} won. Congratulations"
    end
  end
end
  

start_game
initialize_board
display_board(@board)
while @game_over == false
  play
  won_game
  turn_count
  switch_player
end

#Fix valid move method