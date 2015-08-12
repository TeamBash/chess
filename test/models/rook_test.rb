require 'test_helper'

class RookTest < ActiveSupport::TestCase
  test 'valid_move_working' do
  	# set destination square's x & y positions 
  	# to be pawn of the same color
  	dest_x = 0
  	dest_y = 1

  	# create game, rook piece and get board
    game = FactoryGirl.create(:game)
    board = game.get_board
    rook = game.rooks.where(color: 'black')

    # takes the first rook with x_position 0 
    # and try to move it to destination square
    # checks validation returns false for an invalid move.
    valid = rook.first.valid_move?(dest_x, dest_y, board)
    assert_not valid
    
    # set destination square's x & y positions 
  	# to be pawn of the opposing color 
    dest_x = 1
  	dest_y = 6
  	
    rook = Rook.create(y_position: 5, x_position: 6, type: 'Rook', color: 'black', image_name: 'pieces/br.png')
    
    # checks that a capturable piece is not an obstruction
    obstruction = rook.obstructed?(dest_x, dest_y, board)
    assert_not obstruction
    
    # since the rook is not moving in a linear direction, 
    # it's still not a valid move
    valid = rook.valid_move?(dest_x, dest_y, board)
    assert_not valid

    rook = Rook.create(y_position: 5, x_position: 1, type: 'Rook', color: 'black', image_name: 'pieces/br.png')

    # checks validation returns true for a valid move
    valid = rook.valid_move?(dest_x, dest_y, board)
    assert valid
  end
end
