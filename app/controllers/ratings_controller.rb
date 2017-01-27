class RatingsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @rating = @course.ratings.find_by(user_id: current_user.id)
    #@rating = Rating.find_by(course_id: :course_id, user_id: current_user.id)
    if @rating.nil?
    	@rating=@course.ratings.create(value: params[:rating][:value], course_id: :course_id, user_id: current_user.id)	
    else
    	@rating.value=params[:rating][:value]
	  end

	  if @rating.save
	   redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def new
    @course = Course.find(params[:course_id])
    @rating = Rating.new
  end

  def edit
    @course = Course.find(params[:course_id])
    @rating = @course.ratings.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @rating = Rating.find(params[:id])
    @rating.value = params[:rating][:value]
    if @rating.save
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @rating = @course.ratings.find(params[:rating][:id])
    @rating.destroy
    redirect_to course_path(@course)
  end

  def show
    @course = Course.find(params[:course_id])
    @rating = Rating.find(params[:id])
  end

  def index
    @course = Course.find(params[:course_id])
    @ratings = @course.ratings
  end
end