class SessionsController < ApplicationController
	skip_before_filter :authorize
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
      user.state = 1
  		redirect_to user
  	else
  		redirect_to signin_url, alert: "password wrong"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to signin_url, alert:"sign out"
  end
end
