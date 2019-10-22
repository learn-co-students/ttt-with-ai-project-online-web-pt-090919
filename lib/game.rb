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
         puts "Please enter 1-9:"
         input = gets.strip
         location = input_to_location(input)
         if board.valid_move?(location)

           player = current_player
           move(index, player)
           board.display
         else
           turn
         end
     end


    #  def play
    #    board.reset!
    #    system('clear')
    #    puts "Game #{@counter}" if @wargame
    #    board.display
    #    until over?
    #      turn
    #    end
    #    if draw?
    #      puts "WINNER: NONE"
    #    elsif won?
    #      puts "WINNER: #{winner}"
    #    end
    #  end



end
