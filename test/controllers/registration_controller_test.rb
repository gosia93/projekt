require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  test "should get register_organisation" do
    get :register_organisation
    assert_response :success
  end

  test "should get register_volonteer" do
    get :register_volonteer
    assert_response :success
  end

  test "should get register_individual" do
    get :register_individual
    assert_response :success
  end

end
