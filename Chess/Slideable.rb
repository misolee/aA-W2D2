require 'byebug'
module Slideable
  HORIZONTAL_DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  # down, right, up, left
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
  # down_right, up_left, up_right, down_left 
  
  def horizontal_dirs
    result = []
    # debugger

    HORIZONTAL_DIRS.each do |move|
      array = [@pos]
      until array.length == 8
        potential_move = [(array.last.first + move[0]), (array.last.last + move[1])]
        if @board[potential_move].is_a?(Piece)
          next
        else
          array << potential_move
        end
      end
      array.shift
      result.concat(array)
    end
    
    result.select { |pos| pos[0] >= 0 && pos[1] >= 0 && pos[0] <= 7 && pos[1] <= 7}
  end

  def diagonal_dirs
  end
  
end


