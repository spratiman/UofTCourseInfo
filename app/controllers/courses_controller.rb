class CoursesController < ApplicationController
	skip_before_filter :authenticate_user!, :only => [:show, :index, :fetch]
	before_action :redirect_to_index, only: [:create, :new, :edit, :update, :destroy]

	def index
		#@courses = Course.all

		@filterrific = initialize_filterrific(
			Course,
			params[:filterrific],
			persistence_id: 'false',
			:select_options => {
				sorted_by: Course.options_for_sorted_by,
			}
		) or return

		#@courses = Course.all 
		@courses = @filterrific.find.page(params[:page])

		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@course = Course.new(course_params)

		if @course.save
			redirect_to @course
		else
			render 'new'
		end
	end

	def new
		@course =Course.new
	end
		
	def edit
		@course = Course.find(params[:id])
	end

	def show
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])

		if @course.update(course_params)
			redirect_to @course
		else
			render 'edit'
		end
	end

	def destroy
		@course = Course.find(params[:id])
  		@course.destroy

  		redirect_to courses_path
	end

	def search
	  @courses = Course.where(code: :q).or.where(name: :q)

	  render :layout => false
	end

	def fetch
		@courses = Course.all
	end

	private

		def redirect_to_index
			redirect_to courses_path #TODO allow admin to continue without redirecting
		end

		def course_params
			params.require(:course).permit(:code, :name, :description)
		end
end
