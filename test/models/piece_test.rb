require 'test_helper'
require 'pry'

class PieceTest < ActiveSupport::TestCase

  test 'Piece.black returns correct number of black pieces' do 
    board = FactoryGirl.create(:game) 
    assert_equal 16, Piece.black.count
  end

  test 'Piece.white returns correct number of white pieces' do 
    board = FactoryGirl.create(:game) 
    assert_equal 16, Piece.white.count
  end

  test 'king cannot move more than 1 square at a time' do
    board = FactoryGirl.create(:game) 
    king = Piece.where(type: 'King', color: 'black').first
    assert_equal 5, king.x_position
    assert_equal 7, king.y_position
    # assert there exists another piece in the move_to location
    assert_not king.valid_move?(5,7,board)
    # will fail for another reason....write another test
  end

  test 'king is obstructed' do

  end

  # build tests for each separate model (king, rook)
  
end
