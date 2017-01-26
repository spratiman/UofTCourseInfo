require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "UofT Course Info App"
  end


  test "should get root" do
    get static_pages_root
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{{@base_title}}"
  end
  
end
