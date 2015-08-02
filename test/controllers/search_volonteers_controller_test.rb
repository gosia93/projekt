require 'test_helper'

class SearchVolonteersControllerTest < ActionController::TestCase
  setup do
    @search_volonteer = search_volonteers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_volonteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_volonteer" do
    assert_difference('SearchVolonteer.count') do
      post :create, search_volonteer: { city: @search_volonteer.city, volontary_type_id: @search_volonteer.volontary_type_id }
    end

    assert_redirected_to search_volonteer_path(assigns(:search_volonteer))
  end

  test "should show search_volonteer" do
    get :show, id: @search_volonteer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_volonteer
    assert_response :success
  end

  test "should update search_volonteer" do
    patch :update, id: @search_volonteer, search_volonteer: { city: @search_volonteer.city, volontary_type_id: @search_volonteer.volontary_type_id }
    assert_redirected_to search_volonteer_path(assigns(:search_volonteer))
  end

  test "should destroy search_volonteer" do
    assert_difference('SearchVolonteer.count', -1) do
      delete :destroy, id: @search_volonteer
    end

    assert_redirected_to search_volonteers_path
  end
end
