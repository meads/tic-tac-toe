
class CLI
  # display the board on the command line by outputting the board cells
  def display_board(board)
    formatted_cells = board.cells.map.with_index { |cell, idx| cell || (idx + 1).to_s }
    puts "\n"
    puts " #{formatted_cells[0]} | #{formatted_cells[1]} | #{formatted_cells[2]} "
    puts "---+---+---"
    puts " #{formatted_cells[3]} | #{formatted_cells[4]} | #{formatted_cells[5]} "
    puts "---+---+---"
    puts " #{formatted_cells[6]} | #{formatted_cells[7]} | #{formatted_cells[8]} "
    puts "\n"
  end

  # prompt the current player to make a move and read the value
  # from the command line
  def prompt_move(player)
    print "#{player.name} (#{player.marker}), choose an available space (1-9): "
    gets.chomp.to_i - 1
  end

  def invalid_move_message
    puts "Invalid selection! That spot is taken or out of range. Try again."
  end

  def announce_winner(winner)
    puts "#{winner.name} wins!"
  end

  def announce_draw
    puts "It's a draw!"
  end
end
