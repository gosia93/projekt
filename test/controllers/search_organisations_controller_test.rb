require 'test_helper'

class SearchOrganisationsControllerTest < ActionController::TestCase
  setup do
    @search_organisation = search_organisations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_organisations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_organisation" do
    assert_difference('SearchOrganisation.count') do
      post :create, search_organisation: { city: @search_organisation.city, volontary_type_id: @search_organisation.volontary_type_id }
    end

    assert_redirected_to search_organisation_path(assigns(:search_organisation))
  end

  test "should show search_organisation" do
    get :show, id: @search_organisation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_organisation
    assert_response :success
  end

  test "should update search_organisation" do
    patch :update, id: @search_organisation, search_organisation: { city: @search_organisation.city, volontary_type_id: @search_organisation.volontary_type_id }
    assert_redirected_to search_organisation_path(assigns(:search_organisation))
  end

  test "should destroy search_organisation" do
    assert_difference('SearchOrganisation.count', -1) do
      delete :destroy, id: @search_organisation
    end

    assert_redirected_to search_organisations_path
  end
end
