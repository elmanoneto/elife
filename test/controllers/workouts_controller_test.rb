require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase

  test "should get workouts" do
    get :index
    assert_response :success
  end

  test "should create workout" do
    post :create, workout: {type: 'Natação', time: '1h20', date: DateTime.new(2016,2,3)}
    assert_response :success
  end

end
