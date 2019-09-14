require 'pry'

module Players
  class Computer < Player
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
    
    def move_wargames(board)
      n = nil
      if !!winning_move?(board)
        n = winning_move?(board)
      elsif !!block_opponent_win?(board)
        n = block_opponent_win?(board)
      elsif board.cells[4] == " "
        n = "5"
      elsif board.cells[2] == " "
        n = "3"
      elsif board.cells[0] == " "
        n = "1"
      elsif board.cells[8] == " "
        n = "9"
      elsif board.cells[6] == " "
        n = "7"
      else
        until board.valid_move?(n) do
          n = rand(1..9)
        end
      end
      n
    end
    
    def move(board)
      sleep 1  #can't be used in wargames mode
      n = nil
      if !!winning_move?(board)
        n = winning_move?(board)
      elsif !!block_opponent_win?(board)
        n = block_opponent_win?(board)
      elsif board.cells[4] == " "
        n = "5"
      elsif board.cells[2] == " "
        n = "3"
      elsif board.cells[0] == " "
        n = "1"
      elsif board.cells[8] == " "
        n = "9"
      elsif board.cells[6] == " "
        n = "7"
      else
        until board.valid_move?(n) do
          n = rand(1..9)
        end
      end
      n
    end
    
    def winning_move?(board)
      winning_number = nil
      winning_array = WIN_COMBINATIONS.find{|array| (board.cells[array[0]] == self.token && board.cells[array[1]] == self.token && board.cells[array[2]] == " ") || (board.cells[array[2]] == token && board.cells[array[1]] == self.token && board.cells[array[0]] == " ") || (board.cells[array[0]] == token && board.cells[array[2]] == self.token && board.cells[array[1]] == " ")}
      if !!winning_array
        winning_number = (winning_array.find{|index| board.cells[index] == " "} + 1).to_s
      end
      winning_number
    end
    
    def block_opponent_win?(board)
      winning_number = nil
      winning_array = WIN_COMBINATIONS.find{|array| (board.cells[array[0]] == other_player_token && board.cells[array[1]] == other_player_token && board.cells[array[2]] == " ") || (board.cells[array[2]] == other_player_token && board.cells[array[1]] == other_player_token && board.cells[array[0]] == " ") || (board.cells[array[0]] == other_player_token && board.cells[array[2]] == other_player_token && board.cells[array[1]] == " ")}
      if !!winning_array
        winning_number = (winning_array.find{|index| board.cells[index] == " "} + 1).to_s
      end
      winning_number
    end
    
    def other_player_token
      self.token == "X" ? "O" : "X"
    end
    
  end
end