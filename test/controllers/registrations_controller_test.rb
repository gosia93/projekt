require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test "should get register_voolonteer" do
    get :register_voolonteer
    assert_response :success
  end

  test "should get register_organisation" do
    get :register_organisation
    assert_response :success
  end

  test "should get register_individual" do
    get :register_individual
    assert_response :success
  end

end
