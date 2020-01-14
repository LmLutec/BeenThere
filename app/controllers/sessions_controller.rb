class SessionsController < ApplicationController
    include UsersHelper
    include LocationsHelper

    def new
        @user = User.new 
    end 

    def google_auth
      
      @user = User.find_by(email: auth['info']['email']) 

      if @user 
          session[:user_id] = @user.id 
          redirect_to home_path 
      else 
        @user = User.new
        @user.uid = auth['uid']
        @user.first_name = auth['info']['first_name']
        @user.last_name = auth['info']['last_name']
        @user.email = auth['info']['email']
        @user.password = 'omniauthpw'
        @user.save

        session[:user_id] = @user.id
        redirect_to home_path
  
      end 
    end 

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user 
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                render "home"
            else
                redirect_to root_path
            end 
        else
            redirect_to root_path
        end 
    end 

    def home
        @user = User.find_by(id: session[:user_id]) || @user = User.find_by(session[:user_id])
        @reviews = Review.all 
        @locations = Location.all 
        render "home"
    end 

    def destroy
        session.delete :user_id
        flash[:notice] = "Thanks for stopping by"
        redirect_to '/'
    end 

private
 
  def auth
    request.env['omniauth.auth']
  end

end 