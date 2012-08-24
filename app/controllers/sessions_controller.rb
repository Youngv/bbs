# coding: utf-8
class SessionsController < ApplicationController
	skip_before_filter :authorize
    skip_before_filter :current_user, only: [:new, :create]
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
      User.update_counters user.id, :state => 1
  		redirect_to user
  	else
  		redirect_to signin_url, alert: "用户名或密码错误"
  	end
  end

  def destroy
  	session[:user_id] = nil
    User.update_counters current_user.id, :state => -1
  	redirect_to signin_url, alert:"用户已注销"
  end
end
