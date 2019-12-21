class ReviewsController < ApplicationController



    def index
        @reviews = Review.all
    end 

    def new
        @review = Review.new
        @location = Location.find_by(id: params[:location_id])
        @user = User.find_by(id: session[:user_id])
        @location.users.build 
        @location.reviews.build
    end 

    def create
        @location = Location.find_by(id: params[:review][:location_id])
        @user = User.find_by(id: session[:user_id])
        @review = Review.create(review_params)
        @review.save 
    end

    def show 
        @review = Review.find_by(id: params[:review][:user_id])
    end 




    private

    def review_params
        params.require(:review).permit(:location_id, :occasion, :satisfaction, :revisit, :suggest, :living, :stay_length, :food_rating, :events, :comments, :cost_level, :user_id, :location_id)
    end

end
