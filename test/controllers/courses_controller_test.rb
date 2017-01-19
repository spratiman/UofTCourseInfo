require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tom)
  end

   test "should get show" do
     get courses_path
     assert_response :success
   end

   test "should get new" do
     log_in_as(@user)
     #binding.pry
     get new_course_path
     assert_response :success
   end


end
