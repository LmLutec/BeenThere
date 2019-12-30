class ReviewsController < ApplicationController
    before_action :set_review, only: [:edit, :update, :destroy]


    def index
        @reviews = Review.all
    end 

    def edit
        @user = User.find_by(id: session[:user_id])
        @location = @review.location 
    end
  
    def update
        @review.update(review_params)
        location = @review.location 
        redirect_to location_path(location)
    end 

    def destroy
        @review.destroy 
        redirect_to home_path
    end 

    private

    def review_params
        params.require(:review).permit( :user_id, :location_id, :location, :occasion, :satisfaction, :revisit, :suggest, :living, :stay_length, :food_rating, :events, :additional_info, :cost_level)
    end

    def set_review
        @review = Review.find_by(id: params[:id])
    end 
end
