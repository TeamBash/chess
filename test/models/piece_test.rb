require 'test_helper'
require 'pry'

class PieceTest < ActiveSupport::TestCase

  test "Piece.black returns correct number of black pieces" do 
    FactoryGirl.create(:game)
    assert_equal 16, Piece.black.count
  end

  test "Piece.white returns correct number of white pieces" do 
    FactoryGirl.create(:game)
    assert_equal 16, Piece.white.count
  end

end
