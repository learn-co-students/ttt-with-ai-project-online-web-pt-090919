class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    "#{@cells[(input.to_i) - 1]}"
  end
  
  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end
  
  def turn_count
    counter = 0
    @cells.each do |x|
      if x == "X" || x == "O"
        counter += 1
      end
    end
    counter
  end
  
  def taken?(input)
    if @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(input)
    if taken?(input) || input.to_i == 0
      false
    else
      true
    end
  end
  
  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end
  
    
  
end