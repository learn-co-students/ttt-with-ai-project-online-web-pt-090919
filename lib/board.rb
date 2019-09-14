class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " "
  end
  
  def position(input)
    @cells[(input.to_i - 1)]
  end
  
  def full?
    !@cells.any?(" ")
  end
  
  def turn_count
    9 - @cells.count(" ")
  end
  
  def taken?(input)
    position(input) != " "
  end
  
  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9)
  end
  
  def update(input, player)
    if valid_move?(input)
      @cells[input.to_i - 1] = player.token
    end
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
end