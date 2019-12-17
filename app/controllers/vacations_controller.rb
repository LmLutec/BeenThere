class VacationsController < ApplicationController
    before_action :require_login

    def index
        @vacations = Vacation.all 
    end 

    def new
        @vacation = Vacation.new
        
    end 

    def create
        @user = User.find_by(id: session[:user_id])
        @review = Review.new 
        @vacation = @user.vacations.build(vacation_params)
        @vacation.reviews.build 
        @vacation.save
        byebug
        redirect_to vacation_path(@vacation)
    end 

    def show
        @vacation = Vacation.find_by(id: params[:id])
    end 




    private

    def vacation_params
        params.require(:vacation).permit(:occasion, :city, :state, :country, :user_id, review: [:satisfaction, :revisit, :suggest, :living, :food_rating, :events, :comments, :cost_level])
    end 

    def require_login
        unless session[:user_id]
            redirect_to root_path 
        end 

    end
end 


