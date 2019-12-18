class ReviewsController < ApplicationController

    def new
        @review = Review.new
    end 

    def create
        @review = Location.find_by(id: params[:id]).review
    end





    private

    def review_params
        
    end

    def require_login
        @location = Location.find_by(id: params[:id])
        unless session[:user_id] && @location 
    end 

end
