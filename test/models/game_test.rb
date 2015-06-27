require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'game_created' do
    game = FactoryGirl.create(:game)
    expected = %w[black black white white]
    actual = [game.pieces[0].color, game.pieces[8].color, game.pieces[16].color, game.pieces[24].color]
    assert_equal expected, actual
    assert_equal 32, game.pieces.count
    assert_not_empty Game.all
  end

  test 'pieces_created' do
    # populate the board
    game = FactoryGirl.build(:game)
    assert_equal 0, game.pieces.count
    game.save
    assert_equal 32, game.pieces.count
    assert_equal 4, game.pieces.where(type: 'Rook').count
    assert_equal 4, game.pieces.where(type: 'Knight').count
    assert_equal 4, game.pieces.where(type: 'Bishop').count
    assert_equal 2, game.pieces.where(type: 'Queen').count
    assert_equal 2, game.pieces.where(type: 'King').count
    assert_equal 16, game.pieces.where(type: 'Pawn').count
    assert_equal 16, game.pieces.where(color: 'white').count
    assert_equal 16, game.pieces.where(color: 'black').count
    assert_equal 8, game.pieces.where(color: 'white', type: 'Pawn').count
    assert_equal 8, game.pieces.where(color: 'black', type: 'Pawn').count
  end

  test 'board_state' do
    game = FactoryGirl.create(:game)
    board = game.get_board
    assert_not_empty board
  end
end
