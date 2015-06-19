require 'test_helper'

class PieceTest < ActiveSupport::TestCase
 test 'obstructions_working' do
  	# set destination square's x & y positions
  	dest_x = 3
  	dest_y = 1

  	# create game, get board and queen piece
    game = FactoryGirl.create(:game)
    puts game.pieces.count
    board = game.get_board
    p = Queen.create(:y_position => 0, :x_position => 3, :type => "Queen", :color => 'black', :image_name => 'pieces/bq.png')
    puts p
    obstruction = p.obstructed?(dest_x, dest_y, board)
    assert obstruction
  end
end
