require 'test_helper'

class KingTest < ActiveSupport::TestCase
  test 'valid_move_working' do
  	# set destination square's x & y positions 
  	# to be pawn of the same color
  	dest_x = 4
  	dest_y = 1

  	# create game, get board and king piece
    game = FactoryGirl.create(:game)
    board = game.get_board
    king = game.kings.where(color: 'black')

    
    valid = king.first.valid_move?(dest_x, dest_y, board)
    assert_not valid
    
    # set destination square's x & y positions 
  	# to be pawn of the opposing color 
  	# but moving more than 1 square
    dest_x = 4
  	dest_y = 6
  	
    king = King.create(:y_position => 4, :x_position => 4, :type => "King", :color => 'black', :image_name => 'pieces/bk.png')
    
    # checks that the opposing pawn is not an obstruction
    obstruction = king.obstructed?(dest_x, dest_y, board)
    assert_not obstruction
    
    # checks that since piece is moving more than 1 square, 
    # it's still not a valid move
    valid = king.valid_move?(dest_x, dest_y, board)
    assert_not valid
  end
end