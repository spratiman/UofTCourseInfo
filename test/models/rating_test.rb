require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "should_not_allow_multiple_ratings" do
  	rating = Rating.new(user: users(:tom), course: courses(:csc373),
                        rating: "overall")
  	assert_raises(ActiveRecord::RecordNotUnique) do
  		rating.save
  	end
  end

  test "should_not_allow_ratings_without_user" do
  	rating = Rating.new(course: courses(:csc373))
  	assert_not rating.save
  end

  test "should_not_allow_ratings_without_course" do
  	rating = Rating.new(user: users(:tom))
  	assert_not rating.save
  end

  test "should_update_body" do
  	rating = ratings(:one)
  	rating.value = 3
  	assert rating.save
  end
end
