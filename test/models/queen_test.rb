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

    test 'capture' do
    # create game, queen piece and get board
    game = FactoryGirl.create(:game)
    board = game.get_board

    # creates queen 
    piece_to_move = Queen.create( y_position: 4, x_position: 2, type: 'Queen', color: 'black', image_name: 'piece/bq.png')

    # creates pawn
    piece_to_capture = board[6][4]

    # moves queen to capture pawn

    valid = piece_to_move.move_to!(4, 6, board)
    assert = valid

    # reloads to check new position
    piece_to_move.reload
    assert_equal 4, piece_to_move.x_position
    assert_equal 6, piece_to_move.y_position

    # reloads to check pawn has been captured and removed from board
    piece_to_capture.reload
    assert_nil piece_to_capture.x_position
    assert_nil piece_to_capture.y_position

    end
  end

  #   0 1 2 3 4 5 6 7
  # 0 n n n n n n n n
  # 1 n n n n n n n n
  # 2 n n n n Q n n n
  # 3 n n n n n n n n
  # 4 n n n n n n n n
  # 5 n n n n n n n n
  # 6 n n n n P n n n
  # 7 n n n n n n n n
