require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should_allow_multiple_comments" do
  	comment = Comment.new(user: users(:tom), course: courses(:csc373))
  	assert comment.save
  end

  test "should_not_allow_comments_without_user" do
  	comment = Comment.new(course: courses(:csc373))
  	assert_not comment.save
  end

  test "should_not_allow_comments_without_course" do
  	comment = Comment.new(user: users(:tom))
  	assert_not comment.save
  end

  test "should_update_body" do
  	comment = comments(:one)
  	comment.body = "Changed my mind after the results of first term went out..."
  	assert comment.save
  end
end
