class Board
  # define slices of board indices to check for existence of markers in winning positions
  WINNING_LINES = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
    [0, 4, 8], [2, 4, 6]             # Diagonals
  ].freeze

  attr_reader :cells

  def initialize
    # initialize the board cells as an array of 9 nil elements
    @cells = Array.new(9, nil)
  end

  # returns a boolean value indicating that the cell was updated or not and
  # checks first to see if the move is valid
  def update_cell(position, marker)
    return false unless valid_move?(position)
    @cells[position] = marker
    true
  end

  # allow a player position to be marked if it is in bounds of the array
  # and the destination cell currently contains a nil
  def valid_move?(position)
    position.between?(0, 8) && @cells[position].nil?
  end

  # check if the board is full by determining if there are no nil cells remaining
  def full?
    @cells.none?(&:nil?)
  end

  # iterates each winning positions slice of the board indices
  # checking if any given three positions are all filled and 
  # the values are all the same marker, hence uniq
  def winning_marker
    WINNING_LINES.each do |line|
      line_values = @cells.values_at(*line)
      return line_values.first if line_values.compact.size == 3 && line_values.uniq.size == 1
    end
    nil
  end

  # determine if the board is in a terminal state by checking if both
  # the board is full (no remaining nil values) and no winning marker has been 
  # found, hence winning_marker returned nil
  def terminal_state?
    full? || !winning_marker.nil?
  end
end