class SessionsController < ApplicationController
	skip_before_filter :authorize
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user_id
  		redirect_to users_url
  	else
  		redirect_to signin_url, alert: "password wrong"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to signout_url, alert:"sign out"
  end
end
