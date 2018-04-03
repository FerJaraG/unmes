class CoursesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
		render layout: false
	end

	def my_courses
		@my_courses = current_user.courses
		@other_courses = Course.all - current_user.courses
		
	end

end
