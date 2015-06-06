require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'game_created' do

    game = Game.create(name: 'Timezone Roulette', white_user_id: 1, black_user_id: 2)
    game.pieces << King.new(color: 'black')
    game.pieces << Queen.new(color: 'white')
    expected = ['black', 'white', 'black', 'white']
    actual = [game.pieces[0].color, game.pieces[1].color, game.pieces[2].color, game.pieces[3].color ]
    assert_equal expected, actual
    assert_not_empty Game.all
  end

  test 'board' do
  	#populate the board
  	game = FactoryGirl.build(:game)
  	assert_equal 0, game.pieces.count
  	game.save
  	assert_equal 32, game.pieces.count
		assert_equal 4, game.pieces.where(:type => 'Rook').count
    assert_equal 4, game.pieces.where(:type => 'Knight').count
    assert_equal 4, game.pieces.where(:type => 'Bishop').count
    assert_equal 2, game.pieces.where(:type => 'Queen').count
    assert_equal 2, game.pieces.where(:type => 'King').count
    assert_equal 16, game.pieces.where(:type => 'Pawn').count
  end
end
