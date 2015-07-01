require 'test_helper'

class KnightTest < ActiveSupport::TestCase
  test 'valid_move_working' do
  	# set destination square's x & y positions 
  	# to be pawn of the same color
  	dest_x = 3
  	dest_y = 1

  	# create game, knight piece and get board
    game = FactoryGirl.create(:game)
    board = game.get_board
    knight = game.knights.where(color: 'black')

    # takes the first knight with x_position 1 
    # and try to move it to destination square
    # checks validation returns false for an invalid move.
    valid = knight.first.valid_move?(dest_x, dest_y, board)
    assert_not valid
    
    # set destination square's x & y positions 
  	# to be pawn of the opposing color 
  	# but moving in a linear direction
    dest_x = 4
  	dest_y = 6
  	
    knight = Knight.create(y_position: 3, x_position: 3, type: 'Knight', color: 'black', image_name: 'pieces/bn.png')
    
    # checks that a capturable piece is not an obstruction
    obstruction = knight.obstructed?(dest_x, dest_y, board)
    assert_not obstruction
    
    # since the knight is not moving in the correct L shape, 
    # checks that it's still not a valid move
    valid = knight.valid_move?(dest_x, dest_y, board)
    assert_not valid

    knight = Knight.create(y_position: 4, x_position: 3, type: "Knight", color: 'black', image_name: 'pieces/bn.png')

    # checks validation returns true for a valid move
    valid = knight.valid_move?(dest_x, dest_y, board)
    assert valid
  end
end
