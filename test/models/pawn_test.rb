require 'test_helper'

class PawnTest < ActiveSupport::TestCase
  test 'valid_move_working' do
    # set destination square's x & y positions 
    # to be pawn of the same color
    dest_x = 3
    dest_y = 1

  	# create game, pawn piece and get board
    game = FactoryGirl.create(:game)
    board = game.get_board
    pawn = game.pawns.where(color: 'black')

    # takes the first knight with x_position 1 
    # and try to move it to destination square
    # checks validation returns false for an invalid move.
    valid = pawn.first.valid_move?(dest_x, dest_y, board)
    assert_not valid
    
    # set destination square's x & y positions 
    # to be pawn of the opposing color 
    # but moving in a linear direction
    dest_x = 4
  	dest_y = 6
  	
    pawn = pawn.create(y_position: 3, x_position: 3, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', first_move: true)
    
    # checks that a capturable piece is not an obstruction
    obstruction = pawn.obstructed?(dest_x, dest_y, board)
    assert_not obstruction
    
    # since the knight is not moving in the correct L shape, 
    # checks that it's still not a valid move
    valid = pawn.valid_move?(dest_x, dest_y, board)
    assert_not valid

    pawn = Pawn.create(y_position: 4, x_position: 3, type: 'Pawn', color: 'black', image_name: 'pieces/bp.png', first_move: true)

    # checks validation returns true for a valid move
    valid = pawn.valid_move?(dest_x, dest_y, board)
    assert valid
  end
end
