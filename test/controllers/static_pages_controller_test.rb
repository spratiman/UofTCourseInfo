require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "UofT Course Info App"
  end

  test "should get root" do
    get '/'
    assert_response :success
  end

  test "should get home" do
    get '/'
    assert_response :success
    assert_select "title", "Welcome | #{@base_title}"
  end

end
