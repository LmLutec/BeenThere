class UsersController < ApplicationController
    

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
            redirect_to user_path(@user)
        else 
            flash[:notice] = "Complete all fields"
            redirect_to '/'
        end 
    end 

    def show
        @user = User.find_by(id: params[:id])
    end 

    def edit 
        @user = User.find_by(id: params[:id])
    end 

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        @user.save 
        redirect_to user_path(@user)
    end 

    def destroy
        @user = User.find(session[:user_id])
        @user.delete
        redirect_to '/'
    end 


    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :age, :email, :password)
    end
end
