class CommentsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
	@comment = @course.comments.create(body: :body, course_id: :course_id, user_id: current_user.id)
	redirect_to course_path(@course)
  end
end
