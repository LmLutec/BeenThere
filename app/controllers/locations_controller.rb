class LocationsController < ApplicationController
    include LocationsHelper
    include ReviewsHelper
    include CommentsHelper
    include UsersHelper

    before_action :require_login
    before_action :location_count
    before_action :set_location, only: [:show, :edit, :update]


    def index
        @locations = Location.all 
    end 

    def new
        @location = Location.new  
        @user = User.find_by(id: current_user)
    end 

    def create
        @location= Location.find_by(country: params[:location][:country], state: params[:location][:state], city: params[:location][:city])
        
          if location_match(@location)
            params.permit!
            @add.reviews << Review.new(params[:location][:review])
            redirect_to location_path(@add)
          else  
            @location = Location.create(location_params)
            redirect_to location_path(@location)
          end  
           
    end 


    def show
    end 

    def edit
    end 

    def update
        @location.update(location_params) 
        redirect_to location_path(@location)
    end 



    private

    def location_params
        params.require(:location).permit(:city, :state, :country, :user_id, :review => [:location_id, :user_id, :occasion, :satisfaction, :revisit, :suggest, :living, :stay_length, :food_rating, :events, :additional_info, :cost_level])
    end 

    def require_login
        unless session[:user_id]
            redirect_to root_path 
        end 
    end

    def location_count
        Location.all.each do |location|
            total = location.reviews.count 
        if total == 0
            location.destroy
        end 
            end 
    end 

    def set_location
        @location = Location.find_by(id: params[:id])
    end 

   
end 


