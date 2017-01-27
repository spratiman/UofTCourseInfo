require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tom)
  end

   test "should get show" do
     get courses_path
     assert_response :success
   end
end
