
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/cli'


class GameEngine
  # initialize the game with two players and a new board
  # set the first player to make the first move
  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player_idx = 0
    @ui = CLI.new
  end

  # start the game loop that draws the board and prompts the
  # current user to make their move until the board gets in a terminal state
  def start
    until @board.terminal_state?
      @ui.display_board(@board)
      execute_turn
    end

    @ui.display_board(@board)
    handle_game_end
  end

  private

  # provide a means to get the current player.
  def current_player
    @players[@current_player_idx]
  end

  # execute turn is an inner game loop that prompts the current player
  # to make a move, updates the board with that move, and then switches 
  # to the other player handling invalid move messages that may arise 
  # from invalid moves.
  def execute_turn
    loop do
      position = @ui.prompt_move(current_player)
      if @board.update_cell(position, current_player.marker)
        switch_player
        break
      else
        @ui.invalid_move_message
      end
    end
  end

  # toggles the current player index between 0 and 1.
  def switch_player
    @current_player_idx = 1 - @current_player_idx
  end

  # handle_game_end, once the board enters a terminal state will
  # either find the winner by their marker "X" or "O" or will 
  # announce a draw 
  def handle_game_end
    if (winner_marker = @board.winning_marker)
      winner = @players.find { |p| p.marker == winner_marker }
      @ui.announce_winner(winner)
    else
      @ui.announce_draw
    end
  end
end

p1 = Player.new("Player 1", "X")
p2 = Player.new("Player 2", "O")

GameEngine.new(p1, p2).start
