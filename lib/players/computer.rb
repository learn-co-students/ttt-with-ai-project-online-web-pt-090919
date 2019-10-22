module Players
  class Computer < Player

    def move(location)
      location = location.to_i
      position = cells[location - 1]
      taken = position(location) == "X" || position(location) == "O"
      location.between?(1,9) && !taken
    end
  end
end
