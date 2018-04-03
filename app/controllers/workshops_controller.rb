class WorkshopsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@page = (params[:page] || 1).to_i
		if params[:q]
			@workshops = Workshop.where('lower(description) like ?', "%#{params[:q].downcase}%").sorted.page(params[:page])
		else
			@workshops = Workshop.sorted.page(params[:page])
		end
	end

	def show
		@workshop = Workshop.find(params[:id])
		current_user.consume(@workshop)

		if !@workshop.public? and !current_user.has_paid_course?(@workshop.course)
			redirect_to user_pay_path(@current_user)
		end

	end
end
