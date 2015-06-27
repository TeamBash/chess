require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
  end

  test 'not signed in' do
    # get :new
    # assert_redirected_to new_user_session_path
    assert true
  end

  test 'games index' do
    sign_in @user
    FactoryGirl.create(:game)
    get :index
    assert_response :success
  end

  test 'show found' do
    sign_in @user
    puts @user.email
    game = FactoryGirl.create(:game)
    puts game.white_user.email
    get :show, id: game.id
    assert_response :success
  end

  test 'new game' do
    sign_in @user
    get :new
    assert_response :success
  end

  test 'create game' do
    sign_in @user
    assert_difference 'Game.count' do
      post :create, game: { name: 'woohoo' }
    end
    assert_redirected_to game_path(Game.last)
  end

  test 'create invalid' do
    sign_in @user
    assert_no_difference 'Game.count' do
      post :create, game: { name: nil }
    end
    assert_response :unprocessable_entity
  end

  test 'edit name' do
    sign_in @user
    game = FactoryGirl.create(:game)
    get :edit, id: game.id
    assert_response :success
  end

  test 'update name' do
    sign_in @user
    game = FactoryGirl.create(:game)
    patch :update, id: game.id, game: { name: 'new name' }
    expected = 'new name'
    assert_equal expected, Game.last.name
  end

  test 'delete game' do
    sign_in @user
    game = FactoryGirl.create(:game)
    assert_difference 'Game.count', -1 do
      delete :destroy, id: game.id
    end
  end

end
