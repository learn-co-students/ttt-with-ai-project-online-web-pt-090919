class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =[
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
    ]

    def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def current_player
      board.turn_count.even?  ? player_1 : player_2
    end

    def won?
      WIN_COMBINATIONS.find do |comb|
        board.cells[comb[0]] == board.cells[comb[1]] && board.cells[comb[1]] == board.cells[comb[2]] && board.cells[comb[0]] != " "
      end
    end

    def draw?
      board.full? && !won?
    end

    def over?
      won? || draw?
    end

   def winner
     board.cells[won?[0]] if won?
   end


   def turn
  puts "Please enter a number 1-9:"
  @user_input = current_player.move(@board)
  if @board.valid_move?(@user_input)
    @board.update(@user_input, current_player)
  else puts "Please enter a number 1-9:"
    @board.display
    turn
  end
  @board.display
end

def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
