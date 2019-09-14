module Players
  class Human < Player
    
    def move(board)
      puts "Enter a number 1-9, 1 being the top left corner of the board and 9 the bottom right"
      input = gets.chomp
      input
    end
    
  end
end