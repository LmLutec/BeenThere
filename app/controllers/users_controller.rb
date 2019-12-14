class UsersController < ApplicationController
    

    def index
        @users = User.all 
    end 

    def new
        @user = User.new 
    end 

    def create
        @user = User.create(user_params)
        byebug
        if params[:user][:id]
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/'
        end 
    end 

    def show
        @user = User.find_by(id: params[:id])
    end 

    def edit 
        @user = User.find_by(id: params[:id])
        redirect_to user_path(@user)
    end 


    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :age, :email, :password_digest)
    end
end
