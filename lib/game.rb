class Game
  
  attr_accessor :board, :player_1, :player_2, :user_input
  
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if self.board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    x_index = []
    o_index = []
      @board.cells.each_with_index do |spot, i|
        x_index.push(i) if spot == "X"
        o_index.push(i) if spot == "O"
      end
    
    WIN_COMBINATIONS.detect do |nums|
      if (nums - x_index).empty?
        nums
      elsif (nums - o_index).empty?
        nums
      end
    end
  end
  
  def draw?
    if won? || @board.cells.include?(" ")
      false
    else
      true
    end
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    if won?
      nums = won?
      player = nums[0]
      player = @board.cells[player]
    end
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