class LocationsController < ApplicationController
    include LocationsHelper
    include ReviewsHelper
    include CommentsHelper
    include UsersHelper

    before_action :require_login
    before_action :location_count



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
            params[:location][:country] = params[:location][:country].capitalize
            params[:location][:state] = params[:location][:state].capitalize
            params[:location][:city] = params[:location][:city].capitalize
            @location = Location.create(location_params)
            redirect_to location_path(@location)
          end  
           
    end 


    def show
        @location = Location.find_by(id: params[:id]) || @location = Location.find_by(params[:id])
    end 

    def edit 
        @location = Location.find_by(id: params[:id]) || @location = Location.find_by(params[:id])
    end 

    def update
        @location = Location.find_by(id: params[:id])
        @user = User.find_by(id: current_user)
         if @user.locations.include?(@location)
            @r = Review.find_by(location_id: @location, user_id: @user)
             @new = Location.create(location_params)
             @new.reviews << @r 
             redirect_to location_path(@new)
         end
        
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

    # def set_location
    #     @location = Location.find_by(id: params[:id])
    # end 

   
end 


