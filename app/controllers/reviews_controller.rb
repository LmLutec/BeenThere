class ReviewsController < ApplicationController


    def index
        @reviews = Review.all
    end 

    def new
        @review = Review.new
        @location = Location.find_by(id: params[:location_id])
        @location.reviews.build
    end 

    def create
        @location = Location.find_by(id: params[:location_id])
        @location.reviews << params[:review_id]
        #@user = User.find_by(id: session[:user_id])
    end

    def show 
        @reviews = Location.find_by(id: params[:location_id].reviews)
    end 




    private

    def review_params
        params.require(:review).permit(:location_id, :user_id, :occasion, :satisfaction, :revisit, :suggest, :living, :stay_length, :food_rating, :events, :comments, :cost_level)
    end

end
