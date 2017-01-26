require 'test_helper'
include Devise::Test::ControllerHelpers

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	#todo
    log_in_as(user: users(:tom), password: '123greetings')
  end

  test "should_not_allow_course_same_codes" do
  	course = Course.new(code: 'csc373')
  	assert_not course.save
  end

  test "should_not_add_course_without_code" do
  	course = Course.new
  	assert_not course.save
  end
end
