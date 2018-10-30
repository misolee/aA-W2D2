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
  
end

class NullPiece < Piece
  include Singleton
  
  def initialize
  end
  
  def inspect
    "🥡"
  end
end