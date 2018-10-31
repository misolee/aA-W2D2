require 'singleton'
require_relative "board"
require_relative "slideable"

class Piece
  attr_reader :board, :pos
  
  def initialize(starting_pos, board)
    @pos = starting_pos
    # @type = type
    @board = board
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

class Rook < Piece
  include Slideable
  
  def initialize(starting_pos, board)
    super
  end
end

class Bishop < Piece

  def initialize
    super
  end
end

class Queen < Piece

  def initialize
    super
  end
end

class Pawns < Piece
  def initialize
    
  end
end


module Stepable
  def moves
  end
  
  def move_diffs
  end
end