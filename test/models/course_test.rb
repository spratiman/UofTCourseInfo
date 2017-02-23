require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should_not_allow_course_same_codes" do
  	course = Course.new(code: 'abc373')
  	assert_not course.save
  end

  test "should_not_add_course_without_code" do
  	course = Course.new
  	assert_not course.save
  end

  test "should_add_course_with_code" do
    course = Course.new(code: 'abc100')
    assert course.save
  end
end
