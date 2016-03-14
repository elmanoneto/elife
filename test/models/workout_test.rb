require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  test "should check instance of workout" do
    workout = Workout.new
    assert_instance_of Workout, workout
  end

  test "should not save workout without attributes" do
    workout = Workout.new
    assert_not workout.save
  end

end
