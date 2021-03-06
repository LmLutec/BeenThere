class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all 
    end 

    def new 
        @user = User.new 
    end 

    def create
        @user = User.create(user_params)
         @user.save
        
        if @user.id 
            session[:user_id] = @user.id
            redirect_to home_path
        else 
            render '/users/new'
        end 
    end 

    def show
    end 

    def edit 
    end 

    def update
        @user.update(user_params)
        if @user.save 
            redirect_to user_path(@user)
        else 
            render 'users/edit'
        end 
    end 

    def destroy
        @user.destroy
        redirect_to '/'
    end 


    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :age, :email, :password)
    end

    def set_user 
        @user = User.find_by(id: params[:id])
    end 
end
