require "colorize"
require "board"
require "cursor"

class Display
  def initialize
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    board.render
  end
end