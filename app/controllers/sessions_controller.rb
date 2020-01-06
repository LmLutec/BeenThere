require 'pry'
class SessionsController < ApplicationController
    include UsersHelper

    def new
        @user = User.new 
    end 

    def google_auth
      @user = User.from_omniauth(request.env['omniauth.auth'])

      # @user = User.find_or_create_by(uid: auth['uid']) do |u|
      #   u.name = auth['info']['name']
      #   u.email = auth['info']['email']
      #   u.image = auth['info']['image']
      # end
   
      session[:user_id] = @user.id
   
    end 

    def create
          render 'home'
        # @user = User.find_by(email: params[:user][:email])
        # if @user 
        #     if @user.authenticate(params[:user][:password])
        #         session[:user_id] = @user.id 
        #         render "home"
        #     else
        #         redirect_to root_path
        #     end 
        # else
        #     redirect_to root_path
        #end 
    end 

    def home
        @user = User.find_by(id: session[:user_id]) || @user = User.find_by(session[:user_id])
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