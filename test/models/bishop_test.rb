require 'test_helper'

class BishopTest < ActiveSupport::TestCase
  test 'valid_move_working' do
  	# set destination square's x & y positions 
  	# to be pawn of the same color
  	dest_x = 6
  	dest_y = 1

  	# create game, bishop piece and get board
    game = FactoryGirl.create(:game)
    board = game.get_board
    bishop = game.bishops.where(color: 'black')
    
    # takes the first bishop with x_position 2 
    # and try to move it to destination square
    # checks validation returns false for an invalid move.
    valid = bishop.first.valid_move?(dest_x, dest_y, board)
    assert_not valid
    
    # set destination square's x & y positions 
  	# to be pawn of the opposing color 
  	# but moving in a linear direction
    dest_x = 4
  	dest_y = 6
  	
    bishop = Bishop.create(y_position: 3, x_position: 4, type: 'Bishop', color: 'black', image_name: 'pieces/bb.png')
    
    # checks that a capturable piece is not an obstruction
    obstruction = bishop.obstructed?(dest_x, dest_y, board)
    assert_not obstruction
    
    # checks that since the bishop is not moving diagonally, 
    # it's still not a valid move
    valid = bishop.valid_move?(dest_x, dest_y, board)
    assert_not valid

    bishop = Bishop.create(y_position: 2, x_position: 0, type: 'Bishop', color: 'black', image_name: 'pieces/bb.png')
    
    # checks validation returns true for a valid move
    valid = bishop.valid_move?(dest_x, dest_y, board)
    assert valid
  end
end
