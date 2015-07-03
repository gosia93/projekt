require 'test_helper'

class VolontaryTypesControllerTest < ActionController::TestCase
  setup do
    @volontary_type = volontary_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volontary_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volontary_type" do
    assert_difference('VolontaryType.count') do
      post :create, volontary_type: { name: @volontary_type.name }
    end

    assert_redirected_to volontary_type_path(assigns(:volontary_type))
  end

  test "should show volontary_type" do
    get :show, id: @volontary_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volontary_type
    assert_response :success
  end

  test "should update volontary_type" do
    patch :update, id: @volontary_type, volontary_type: { name: @volontary_type.name }
    assert_redirected_to volontary_type_path(assigns(:volontary_type))
  end

  test "should destroy volontary_type" do
    assert_difference('VolontaryType.count', -1) do
      delete :destroy, id: @volontary_type
    end

    assert_redirected_to volontary_types_path
  end
end
