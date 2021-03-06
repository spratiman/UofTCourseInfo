class CommentsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
	  @comment = @course.comments.create(body: params[:comment][:body], course_id: :course_id, user_id: current_user.id)

    if @comment.save
	    redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def new
    @course = Course.find(params[:course_id])
    @comment = Comment.new
  end

  def edit
  	@course = Course.find(params[:course_id])
  	@comment = @course.comments.find(params[:id])
  end

  def update
  	@course = Course.find(params[:course_id])
  	@comment = Comment.find(params[:id])
  	@comment.body = params[:comment][:body]
  	if @comment.save
  		redirect_to course_path(@course)
  	else
  		render 'edit'
  	end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @comment = @course.comments.find(params[:comment][:id])
    @comment.destroy
    redirect_to course_path(@course)
  end

  def show
    @course = Course.find(params[:course_id])
    @comment = Comment.find(params[:id])
  end

  def index
    @course = Course.find(params[:course_id])
    @comments = Comment.where({course_id: :course_id})
  end
end
