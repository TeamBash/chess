require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'game_created' do
    game = Game.create(name: 'Timezone Roulette', white_user_id: 1, black_user_id: 2)
    game.pieces << King.new(color: 'black')
    game.pieces << King.new(color: 'white')
    game.pieces << Queen.new(color: 'black')
    game.pieces << Queen.new(color: 'white')

    expected = ['black', 'white', 'black', 'white']
    actual = [game.pieces[0].color, game.pieces[1].color, game.pieces[2].color, game.pieces[3].color ]
    assert_equal expected, actual
    assert_not_empty Game.all
  end
end
