class RatingsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
	@rating = @course.ratings.create(value: :value, course_id: :course_id, user: current_user.id)
	redirect_to course_path(@course)
  end
end