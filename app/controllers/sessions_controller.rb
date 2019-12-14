class SessionsController < ApplicationController

    def new
        @user = User.new 
    end 

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        end 
    end 

    def destroy
        session.delete :user_id
        redirect_to '/'
    end 

end 