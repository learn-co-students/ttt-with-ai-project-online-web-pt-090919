class Board

  attr_accessor :cells

    def initialize
      reset!
    end

    def reset!
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(location)
      location = location.to_i
      cells[location - 1]
    end

    def full?
      @cells.none?{|el| el == " " || el == "" || el == nil}
    end

    def turn_count
      cells.count {|cell| cell == "X" || cell == "O"}
    end

    def taken?(location)
      position(location) == "X" || position(location) == "O"
    end

    def valid_move?(location)
      location = location.to_i
      location.between?(1,9) && !taken?(location)
    end

    def update(location, player)
    location = location.to_i
    cells[location -1] = player.token
  end
end
