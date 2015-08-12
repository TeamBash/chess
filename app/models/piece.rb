class Piece < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  # scopes
  scope :black,    -> { where(color: 'black') }
  scope :white,    -> { where(color: 'white') }
  scope :kings,    -> { where(type: 'King') }
  scope :queens,   -> { where(type: 'Queen') }
  scope :bishops,  -> { where(type: 'Bishop') }
  scope :knights,  -> { where(type: 'Knight') }
  scope :pawns,    -> { where(type: 'Pawn') }
  scope :rooks,    -> { where(type: 'Rook') }

  image_name = {
   'whiteQueen'   => 'pieces/wq.png',
   'whiteKing'    => 'pieces/wk.png',
   'whiteRook'    => 'pieces/wr.png',
   'whiteBishop'  => 'pieces/wb.png',
   'whiteKnight'  => 'pieces/wn.png',
   'whitePawn'    => 'pieces/wp.png',
   'blackQueen'   => 'pieces/bq.png',
   'blackKing'    => 'pieces/bk.png',
   'blackRook'    => 'pieces/br.png',
   'blackBishop'  => 'pieces/bb.png',
   'blackKnight'  => 'pieces/bn.png',
   'blackPawn'    => 'pieces/bp.png'
  }

  def piece_image
    image_name["#{self.color}" + "#{self.type.capitalize}"]
  end
  
  def move_to!(x, y, board)
    # destination square 
    dest_square = board[y][x]

    # if valid move = true
    # move the captured piece off the board
    # update the piece to move to destination square
    if self.valid_move?(x, y, board) == true 
      self.update_attributes(x_position: x, y_position: y)
      
      if self.first_move
        self.first_move = false
      end
      
      if dest_square.nil?
        return nil
      else
        dest_square.update_attributes(x_position: nil, y_position: nil, state: 'captured')
        return dest_square
      end
    end
  end


  def captured_pieces
    pieces.where(state: 'off-board')
  end

  def valid_move?(x, y, board)
    raise "SYSTEM ERROR: Abstract method"
  end
  
  # might consider adding an additional move validation method that first
  # checks the desired move keeps the piece on the board.
  # If new coordinates < (0,0) || > (7,7) (squishily-defined), then reject immediately
  # include this validation in valid_move?
  

  # include obstructions for obstruction checks
  include Obstructions

  def obstructed?(x, y, board)
    # checks if destination is obstructed
    capturable = destination_obstructed(x, y, board)
    return true if capturable.nil?

    # checks if destination is blocked diagonally
    capturable = diagonal_obstructed(x, y, board)
    return true if capturable && same_color?(capturable)

    # checks if destination is blocked vertically or horizontally
    capturable = linear_obstructed(x, y, board)
    return true if capturable && same_color?(capturable)

    # returns false if no pieces were found in path.
    # or piece is capturable
    return false 
  end
end
