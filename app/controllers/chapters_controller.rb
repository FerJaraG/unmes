class ChaptersController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@course = Course.find(params[:course_id])
  	@chapters = @course.chapters.sorted
  end
end
