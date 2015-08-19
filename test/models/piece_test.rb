require 'test_helper'

class PieceTest < ActiveSupport::TestCase
 test 'obstructions_working' do
  	# set destination square's x & y positions
  	dest_x = 4
  	dest_y = 1

  	# create game, test piece and retrieve board
    game = FactoryGirl.create(:game)
    board = game.get_board
    p = Queen.create(y_position: 0, x_position: 3, type: 'Queen', color: 'black', image_name: 'pieces/bq.png')
    
    # check each tests in obstructed? method separately 
    # destination is same color, so obstruction should return nil
    obstruction = p.destination_obstructed(dest_x, dest_y, board)
    assert_nil obstruction
    
    # we know the test piece is diagonally obstructed, 
    # so we test for same color as well
    obstruction = p.diagonal_obstructed(dest_x, dest_y, board)
    obstruction = p.same_color?(obstruction)
    assert obstruction
    
    obstruction = p.linear_obstructed(dest_x, dest_y, board)
    assert_nil obstruction
    
    # checks when put all together the obstructed? method gives same result
    obstruction = p.obstructed?(dest_x, dest_y, board)
    assert obstruction
  end

  test 'not valid to not move a piece' do
    game = FactoryGirl.create(:game)
    board = game.get_board

    black_pawn = board[1][1]


    valid = black_pawn.move_to!(1, 1, board)
    assert_not valid
  end

  test 'can be captured' do
    game = FactoryGirl.create(:game)
    board = game.get_board

    black_queen = Queen.create(y_position: 4, x_position: 4, type: 'Queen', color: 'black', image_name: 'pieces/bq.png')

    # queen can capture this pawn
    piece_to_capture = board[6][4]

    valid = piece_to_capture.can_be_captured?
    assert = valid
  end
end


#by_bug
# y = row 
# x = col

#   0 1 2 3 4 5 6 7
# 0 - - - - - - - -
# 1 - - - - - - - -
# 2 - - - - Q - - -
# 3 - - - - - - - -
# 4 - - - - - - - -
# 5 - - - - - - - -
# 6 - - - - P - - -
# 7 - - - - K - - -