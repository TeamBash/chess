class Piece < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  # scopes
  def self.b
    where(color: 'b')
  end

  def self.w
    where(color: 'w')
  end

  image_name = {
   'whiteQueen' => 'pieces/wq.png',
   'whiteKing' => 'pieces/wk.png',
   'whiteRook' => 'pieces/wr.png',
   'whiteBishop' => 'pieces/wb.png',
   'whiteKnight' => 'pieces/wn.png',
   'whitePawn' => 'pieces/wp.png',
   'blackQueen' => 'pieces/bq.png',
   'blackKing' => 'pieces/bk.png',
   'blackRook' => 'pieces/br.png',
   'blackBishop' => 'pieces/bb.png',
   'blackKnight' => 'pieces/bn.png',
   'blackPawn' => 'pieces/bp.png'
  }

  def piece_image
    image_name["#{self.color}" + "#{self.type.capitalize}"]
  end

  def valid_move?(x, y, board)
    raise "SYSTEM ERROR: Abstract method"
  end

  def move_to!(x, y, board)
    if x == nil
      return render text: 'Not Allowed', status: 'offboard' 
    elsif obstructed?(x, y, board)
      return render text: 'Move is obstructed', status: 'obstructed'
    else
      return render text: 'Successful move', status: 'onboard'
    end
  end

  # include obstructions for obstruction checks
  include Obstructions

  def obstructed?(x, y, board)
    # checks if destination is obstructed
    capturable = destination_obstructed?(x, y, board)
    return true if capturable.nil?

    # checks if destination is blocked diagonally
    capturable = diagonal_obstructed(x, y, board)
    return true if capturable && same_color?(capturable)

    # checks if destination is blocked vertically or horizontally
    capturable = linear_obstructed(x, y, board)
    return true if capturable && same_color?(capturable)

    # returns no obstructions if no pieces were found in path.
    # or piece is capturable
    return false 
  end
end
