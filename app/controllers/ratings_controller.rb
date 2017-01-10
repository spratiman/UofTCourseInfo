class RatingsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @rating = @course.ratings.find_by(user_id: current_user.id)
    #@rating = Rating.find_by(course_id: :course_id, user_id: current_user.id)
    if @rating.nil?
    	@course.ratings.create(value: params[:rating][:value], course_id: :course_id, user_id: current_user.id)	
    else
    	@rating.value=params[:rating][:value]
	end
	@rating.save
	redirect_to course_path(@course)
  end
end