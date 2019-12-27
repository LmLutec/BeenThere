class ReviewsController < ApplicationController



    def index
        @reviews = Review.all
    end 

    def new
        @review = Review.new

        # @location = Location.find_by(id: params[:location_id])
         @user = User.find_by(id: session[:user_id])
        # @location.users.build 
        # @location.reviews.build
    end 

    def create
        # @location = Location.find_by(id: params[:review][:location_id])
        # @user = User.find_by(id: session[:user_id])
        @review = Review.create(review_params)
        #@location.reviews << @review 
            redirect_to location_path(@location)
    end

    def show 
        @review = Review.find_by(id: params[:id])
    end 

    def edit
        @user = User.find_by(id: session[:user_id])
        @review = Review.find_by(id: params[:id])
        @location = @review.location 
    end
  
    def update
        @review = Review.find_by(id: params[:id])
        @review.update(review_params)
        location = @review.location 
    
        redirect_to location_path(location)
        #@location.update(location_params)
    end 

    private

    def review_params
        params.require(:review).permit( :user_id, :location_id, :location, :occasion, :satisfaction, :revisit, :suggest, :living, :stay_length, :food_rating, :events, :comments, :cost_level)
    end

end
