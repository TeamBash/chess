class Piece < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  # scopes
  def self.black
    where(color: 'black')
  end

  def self.white
    where(color: 'white')
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
