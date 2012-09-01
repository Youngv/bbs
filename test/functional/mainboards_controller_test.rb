require 'test_helper'

class MainboardsControllerTest < ActionController::TestCase
  setup do
    @mainboard = mainboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mainboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mainboard" do
    assert_difference('Mainboard.count') do
      post :create, mainboard: { name: @mainboard.name }
    end

    assert_redirected_to mainboard_path(assigns(:mainboard))
  end

  test "should show mainboard" do
    get :show, id: @mainboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mainboard
    assert_response :success
  end

  test "should update mainboard" do
    put :update, id: @mainboard, mainboard: { name: @mainboard.name }
    assert_redirected_to mainboard_path(assigns(:mainboard))
  end

  test "should destroy mainboard" do
    assert_difference('Mainboard.count', -1) do
      delete :destroy, id: @mainboard
    end

    assert_redirected_to mainboards_path
  end
end
