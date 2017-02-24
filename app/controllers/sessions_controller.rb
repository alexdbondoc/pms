class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			if user.designation.name == "Department Head"
				if user.department.name == "Information and Communication Technology"
					redirect_to consolidates_path
				elsif user.department.name == "Property and Procurement"
					redirect_to consolidates_path
				else
					redirect_to requests_path
				end
			elsif user.designation.name == "Group Head"
				redirect_to consolidates_path
			else
				redirect_to users_path
			end			
		else
			flash.now[:danger] = "There was something wrong with your login information"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to login_path
	end
end