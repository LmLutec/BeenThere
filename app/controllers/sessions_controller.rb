class SessionsController < ApplicationController
    include UsersHelper

    def new
        @user = User.new 
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
        render "home"
    end 

    def destroy
        session.delete :user_id
        flash[:notice] = "Thanks for stopping by"
        redirect_to '/'
    end 

end 