require 'test_helper'

class QueenTest < ActiveSupport::TestCase
  test 'valid_move_working' do
  	# set destination square's x & y positions 
  	# to be pawn of the same color
  	dest_x = 3
  	dest_y = 1

  	# create game, queen piece and get board
    game = FactoryGirl.create(:game)
    board = game.get_board
    queen = game.queens.where(color: 'black')

    # checks validation returns false for an invalid move.
    valid = queen.first.valid_move?(dest_x, dest_y, board)
    assert_not valid
    
    # set destination square's x & y positions 
  	# to be pawn of the opposing color 
    dest_x = 4
  	dest_y = 6
  	
    queen = Queen.create(y_position: 3, x_position: 6, type: 'Queen', color: 'black', image_name: 'pieces/bq.png')
    
    # checks that a capturable piece is not an obstruction
    obstruction = queen.obstructed?(dest_x, dest_y, board)
    assert_not obstruction
    
    # since the queen is not moving on a linear or diagonal, 
    # it's still not a valid move
    valid = queen.valid_move?(dest_x, dest_y, board)
    assert_not valid

    queen = Queen.create(y_position: 4, x_position: 6, type: 'Queen', color: 'black', image_name: 'pieces/bq.png')

    # checks validation returns true for a valid move
    valid = queen.valid_move?(dest_x, dest_y, board)
    assert valid
  end
end
