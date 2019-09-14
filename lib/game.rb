class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
    
    def current_player
      if @board.turn_count.even?
        @player_1
      elsif @board.turn_count.odd?
        @player_2
      end
    end
    
    def won?
      WIN_COMBINATIONS.each do |array|
        if @board.cells[array[0]] == @board.cells[array[1]] && @board.cells[array[1]] == @board.cells[array[2]] && @board.cells[array[0]] != " "
          return array
        end
      end
      false
    end
    
    def draw?
      (!won? && @board.full?) ? true : false
    end
    
    def over?
      draw? || won?
    end
    
    def winner
      won? ? @board.cells[won?[0]] : nil
    end
    
    def turn
      input = ""
      until @board.valid_move?(input)
        input = current_player.move(@board)
      end
      @board.update(input, current_player)
    end
    
    def turn_wargames
      input = ""
      until @board.valid_move?(input)
        input = current_player.move_wargames(@board)
      end
      @board.update(input, current_player)
    end
    
    def play
      until over? do
        turn
        @board.display
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
    
    def play_wargames
      count = 0
      until i = 100 do 
        until over? do
          turn_wargames
        end
        if won?
          count += 1
        end
        i += 1
      end
      puts "The computer won #{count} out of 100 games."
    end
    
    def self.computer_game
      game = Game.new(Players::Computer.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
      game.play
    end
    
    def self.one_player
      puts "If you would like to go first, enter '1'"
      puts "If you would like to go second, enter '2'"
      input = gets.chomp
      if input == "1"
        game = Game.new(Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
        game.play
      elsif input =="2"
        game = Game.new(Players::Computer.new("X"), player_2=Players::Human.new("O"), board=Board.new)
        game.play
      else
        puts "Invalid input, please enter '1' or '2'"
        self.one_player
      end
    end
    
    def self.two_player
      game = Game.new(Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      game.play
    end
    
    def self.welcome
      puts "Welcome to TicTacToe"
      loop do 
        puts "What kind of game would you like to play?"
        puts "Enter '0' for computer v computer."
        puts "Enter '1' for one player"
        puts "Enter '2' for two player"
        puts "Enter 'exit' to leave"
        input = gets.chomp
        if input == "0"
          self.computer_game
        elsif input == "1"
          self.one_player
        elsif input == "2"
          self.two_player
        elsif input == "wargames"
          game = Game.new(Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
          game.play_wargames
        elsif input == "exit"
          break
        else
          puts "Invalid input."
        end
        puts "Would you like to play again? (y/n)"
        input = gets.chomp
        until input == "y" || input == "n" do
          puts "invalid input. Type 'y' or 'n'"
          input = gets.chomp
        end
        if input == "n"
          puts "Exiting game. Hope to see you again soon!"
          break
        end
      end
    end
    
end