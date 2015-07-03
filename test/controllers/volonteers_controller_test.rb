require 'test_helper'

class VolonteersControllerTest < ActionController::TestCase
  setup do
    @volonteer = volonteers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volonteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volonteer" do
    assert_difference('Volonteer.count') do
      post :create, volonteer: { about: @volonteer.about, age: @volonteer.age, city: @volonteer.city, name: @volonteer.name, surname: @volonteer.surname, user_id: @volonteer.user_id, volontary_type_id: @volonteer.volontary_type_id }
    end

    assert_redirected_to volonteer_path(assigns(:volonteer))
  end

  test "should show volonteer" do
    get :show, id: @volonteer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volonteer
    assert_response :success
  end

  test "should update volonteer" do
    patch :update, id: @volonteer, volonteer: { about: @volonteer.about, age: @volonteer.age, city: @volonteer.city, name: @volonteer.name, surname: @volonteer.surname, user_id: @volonteer.user_id, volontary_type_id: @volonteer.volontary_type_id }
    assert_redirected_to volonteer_path(assigns(:volonteer))
  end

  test "should destroy volonteer" do
    assert_difference('Volonteer.count', -1) do
      delete :destroy, id: @volonteer
    end

    assert_redirected_to volonteers_path
  end
end
