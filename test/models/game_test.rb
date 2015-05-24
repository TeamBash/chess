require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "game_created" do
    game = Game.create(name: 'Timezone Roulette')

    expected = 'Timezone Roulette'
    actual = game.name
    assert_equal expected, actual
    assert_not_empty Game.all
  end
end
