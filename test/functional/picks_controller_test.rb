require 'test_helper'

class PicksControllerTest < ActionController::TestCase
  setup do
    @pick = picks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:picks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pick" do
    assert_difference('Pick.count') do
      post :create, pick: { away_picked: @pick.away_picked, game_id: @pick.game_id, game_teams: @pick.game_teams, home_picked: @pick.home_picked, line: @pick.line, user_id: @pick.user_id }
    end

    assert_redirected_to pick_path(assigns(:pick))
  end

  test "should show pick" do
    get :show, id: @pick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pick
    assert_response :success
  end

  test "should update pick" do
    put :update, id: @pick, pick: { away_picked: @pick.away_picked, game_id: @pick.game_id, game_teams: @pick.game_teams, home_picked: @pick.home_picked, line: @pick.line, user_id: @pick.user_id }
    assert_redirected_to pick_path(assigns(:pick))
  end

  test "should destroy pick" do
    assert_difference('Pick.count', -1) do
      delete :destroy, id: @pick
    end

    assert_redirected_to picks_path
  end
end
