require "colorize"
require_relative "board"
require_relative "cursor"

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def render
    system('clear')
    puts "--------------------------".colorize(:red)
    puts "Current state of the board".colorize(:red)
    puts "Cursor located at #{@cursor.cursor_pos}".colorize(:red)
    
    @board.grid.each_with_index do |row, idx1|
      row.each_with_index do |el, idx2|
        if [idx1, idx2] == @cursor.cursor_pos
          print el.inspect.colorize(:green).colorize(:background => :black) + " ".colorize(:background => :black) + " "
        else
          print el.inspect.colorize(:black) + "  "
        end
      end
      puts
    end
  end
  
  def test_loop
    input = false
    until input == true
      input = @cursor.get_input
      render
    end
  end
end