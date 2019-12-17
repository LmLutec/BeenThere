class ReviewsController < ApplicationController

    def new
        @review = Review.new
    end 

    def create
        @review = Vacation.find_by(id: params[:id]).review
    end





    private

    def review_params
        
    end

    def require_login
        @vacation = Vacation.find_by(id: params[:id])
        unless session[:user_id] && @vacation 
    end 
end



