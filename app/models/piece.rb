class Piece < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  # scopes
  # for additional detail see...
  # http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html
  # this is simply 'syntactic sugar' for defining an actual class method

  def self.black
    where(color: 'black')
    # Piece.black.first
    # SELECT "pieces".* FROM "pieces" WHERE "pieces"."color" = 'black'
    # Piece.black.count # 16
  end

  def self.white
    where(color: 'white')
    # Piece.white.first
    # SELECT "pieces".* FROM "pieces" WHERE "pieces"."color" = 'white'
    # Piece.white.count # 16
  end
  
#   def as_json(options:{})
#     monkey = super(options)
#     new_stuff = { 'image' => 'rook.png' }      
#     monkey.merge(new_stuff)
#   end

  

  # returns true/false
  # checks whether a given piece move is valid considering current location, 
  # desired move target and state of the board

  def valid_move?(desire_x_coordinate, desire_y_coordinate, board)
    raise NotImplementedError, 'all pieces need this method'
    # not implemented error
    
    # board is an instance of Game
    # board stores the collection of pieces (and their locations in x/y-space
    
  end

  def move_to!(x, y, board)
    if x.nil?
      render text: 'Not Allowed'
    elsif obstructed?(x, y, board)
      render text: 'Move is obstructed'
    else
      render text: 'Successful move'
    end
  end

  # include obstructions for obstruction checks
  include Obstructions

  def obstructed?(x, y, board)
    # checks if destination is obstructed
    capturable = destination_obstructed?(x, y, board)
    return false if capturable.nil?

    # checks if destination is blocked diagonally
    capturable = diagonal_obstructed(x, y, board)
    return false if capturable.nil?
    same_color?(capturable) ? (return true) : (return false)

    # checks if destination is blocked vertically or horizontally
    capturable = linear_obstructed(x, y, board)
    return false if capturable.nil?
    same_color?(capturable) ? (return true) : (return false)
  end
end
