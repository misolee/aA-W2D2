require "io/console"
require "colorize"
# require_relative "display"
require_relative "board"


KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  def render
    puts "Current state of the board"
    # p board.grid[0]
    # p board.grid[1]
    # p board.grid[2]
    # p board.grid[3]
    # p board.grid[4]
    # p board.grid[5]
    # p board.grid[6]
    # p board.grid[7]
    # p "-----------------------"
    
    board.grid.each do |row|
      row.each do |pos|
        print pos.inspect + "  "
      end
      puts
    end
  end
  
  def test_loop
    @x = false
    until @x == true
      self.get_input
      render
    end
  end
  
  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :return, :space
      return @cursor_pos
    when :left 
      update_pos([0, -1])
      nil
    when :right 
      update_pos([0, 1])
      nil
    when :up
      update_pos([-1, 0])
      nil
    when :down
      update_pos([1, 0])
      nil
    when :ctrl_c
      Process.exit
    when :escape
      @x = true
    end
  end

  def update_pos(diff)
    row_pos = @cursor_pos[0] + diff[0]
    col_pos = @cursor_pos[1] + diff[1]
    row_pos = 0 if row_pos == 8
    col_pos = 0 if col_pos == 8
    row_pos = 7 if row_pos == -1
    col_pos = 7 if col_pos == -1
    new_pos = [row_pos, col_pos]
    @cursor_pos = new_pos if board.valid_pos?(new_pos)
    p @cursor_pos
  end
  
  # def render
  #   Display.render
  #   # @cursor_pos.colorize(:red)
  # end
  # 
  # def test_loop
  #   until false
  #     self.get_input
  #     render
  #   end
  # end
end