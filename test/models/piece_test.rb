require 'test_helper'

class PieceTest < ActiveSupport::TestCase
 test 'obstructions_working' do
  	# set destination square's x & y positions
  	dest_x = 4
  	dest_y = 1

  	# create game, test piece and retrieve board
    game = FactoryGirl.create(:game)
    board = game.get_board
    piece = board[dest_y][dest_x]
    p = Queen.create(:y_position => 0, :x_position => 3, :type => "Queen", :color => 'black', :image_name => 'pieces/bq.png')
    
    # check each tests in obstructed? method separately 
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
end
