class LocationsController < ApplicationController
    before_action :require_login

    def index
        @locations = Location.all 
    end 

    def new
        @location = Location.new  
        @user = User.find_by(id: session[:user_id])
    end 

    def create
        @location = Location.create(location_params)
        flash[:notice] = "Location created"
        redirect_to new_location_review_path(@location)
    end 

    def show
        @location = Location.find_by(id: params[:id])
    end 




    private

    def location_params
        params.require(:location).permit(:city, :state, :country, :user_id, reviews_attributes: [:user_id, :occasion, :satisfaction, :revisit, :suggest, :living, :food_rating, :events, :comments, :cost_level])
    end 

    def require_login
        unless session[:user_id]
            redirect_to root_path 
        end 

    end
end 


