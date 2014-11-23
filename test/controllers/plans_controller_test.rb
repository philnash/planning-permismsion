require 'test_helper'

class PlansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    plan = Plan.create
    get :show, :id => plan.to_param
    assert_response :success
  end
end
