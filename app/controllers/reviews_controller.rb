class ReviewsController < ApplicationController



    def index
        @reviews = Review.all
    end 

    def new
        @location = Location.find_by(id: params[:location_id])
        @user = User.find_by(id: session[:user_id])
        @location.users.build 
        @location.reviews.build
    end 

    def create
        @location = Location.find_by(id: params[:review][:location_id])
        @user = User.find_by(id: session[:user_id])
        @review = Review.create(id: params[:location_id])
        @location.reviews << @review 
            redirect_to location_path(@location)
    end

    def show 
    
    end 




    private

    def review_params
        params.require(:review).permit(:id, :user_id, :location_id,:occasion, :satisfaction, :revisit, :suggest, :living, :stay_length, :food_rating, :events, :comments, :cost_level)
    end

end
