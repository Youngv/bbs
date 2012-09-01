# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize, :current_user, :get_mainboards_and_hot_boards
  helper_method :signin?, :current_user, 
  
  protected
  	def authorize
  		unless User.find_by_id(session[:user_id])
  			redirect_to signin_url, notice:"用户请先登录"
  		end
  	end

  	def current_user
  		@current_user = login_from_session unless defined?(@current_user)
      @current_user
  	end

    def signin?
      !!current_user
    end

    def login_from_session
      if session[:user_id].present?
        begin
          User.find session[:user_id]
        rescue
          session[:user_id] = nil
        end
      end
    end

    def get_mainboards_and_hot_boards
      @get_mainboards = Mainboard.all
      @hot_boards = Board.limit(3)
    end
end
