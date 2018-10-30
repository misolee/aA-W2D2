require 'singleton'

class Piece
  
  def initialize
    @color
    @board
    @pos
  end
  
  def inspect
    "♟"
  end
  
  def moves
    result = []
    
  end
end

class NullPiece < Piece
  include Singleton
  
  def initialize
  end
  
  def inspect
    "🥡"
  end
end

class SlidingPiece < Piece
end

class SteppingPiece < Piece
end

class Pawns < Piece
end

module Sliedeable
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []
  
  def horizontal_dirs
  end
  
  def diagonal_dirs
  end
  
  def moves
  end
  
  private
  
  def move_dirs
  end
  
  def grow_unblocked_moves_in_dir(dx, dy)
  end
end

module Stepable
  def moves
  end
  
  def move_diffs
  end
end