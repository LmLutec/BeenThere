class ReviewsController < ApplicationController
    include UsersHelper

    before_action :set_review, only: [:edit, :update, :destroy]


    def index
        @reviews = Review.all
        @business_occasion = Review.business_occasion
    end 

    def edit
        @user = User.find_by(id: session[:user_id])
        @location = @review.location 
    end
  
    def update

        @user = User.find_by(id: current_user)
        @location = @review.location

        if @review.update(review_params)
          redirect_to location_path(@location)
        else 
          render 'reviews/edit'
        end 
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
