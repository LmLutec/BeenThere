class VacationsController < ApplicationController
    before_action :require_login

    def index
        @vacations = Vacation.all 
    end 

    def new
        @vacation = Vacation.new 
        @vacation.reviews.build 
        @user = User.find_by(id: session[:user_id])
        @user.reviews.build 
    end 

    def create
        @vacation = Vacation.create(vacation_params)
        flash[:notice] = "Vacation created"
        redirect_to vacation_path(@vacation) 
    end 

    def show
        @vacation = Vacation.find_by(id: params[:id])
    end 




    private

    def vacation_params
        params.require(:vacation).permit(:occasion, :city, :state, :country, :user_id, reviews_attributes: [:user_id, :satisfaction, :revisit, :suggest, :living, :food_rating, :events, :comments, :cost_level])
    end 

    def require_login
        unless session[:user_id]
            redirect_to root_path 
        end 

    end
end 


