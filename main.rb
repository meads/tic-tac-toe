
class TicTacToe
    attr_accessor :square_one, :square_two, :square_three, 
                :square_four, :square_five, :square_six,
                :square_seven, :square_eight, :square_nine
    
    def initialize()
      @square_one = "_"
      @square_two = "_"
      @square_three = "_"
      @square_four = "_"
      @square_five = "_"
      @square_six = "_"
      @square_seven = "_"
      @square_eight = "_"
      @square_nine = "_"
    end

    def draw_board()
        self.clear_board()
        puts "#{@square_one} | #{@square_two} | #{@square_three}\n#{@square_four} | #{@square_five} | #{@square_six}\n#{@square_seven} | #{@square_eight} | #{@square_nine}\n"
    end

    def clear_board()
      puts "\e[H\e[2J"
    end

end

t = TicTacToe.new()
t.draw_board()
sleep 3
t.square_one = "X"
t.draw_board()
sleep 3
t.square_five = "O"
t.draw_board()
sleep 3
t.square_eight = "X"
t.draw_board()
sleep 3
t.square_six = "O"
t.draw_board()
sleep 3
t.square_four = "X"
t.draw_board()
sleep 3
t.square_three = "O"
t.draw_board()
sleep 3
t.square_seven = "X"
t.draw_board()
