class LocationsController < ApplicationController
    include LocationsHelper
    include ReviewsHelper
    include CommentsHelper
    include UsersHelper

    before_action :require_login
    before_action :location_count
    before_action :set_location, only: [:show, :edit, :update]
    before_action :set_user, only: [:new, :create, :update]
    


    def index
        @locations = Location.all 
    end 

    def new
        @location = Location.new  
    end 

    def create
        @location = Location.find_by(country: capitalize_location(params[:location][:country]), state: params[:location][:state].upcase, city: capitalize_location(params[:location][:city]))
        
          if location_match(@location)
            params.permit!
            new_review =  Review.new(params[:location][:review])
            if new_review
                @add.reviews << new_review
                redirect_to location_path(@add)
            else 
                render 'locations/new' 
            end 
          else  
            params[:location][:country] = capitalize_location(params[:location][:country])
            params[:location][:state] = params[:location][:state].upcase
            params[:location][:city] = capitalize_location(params[:location][:city])


            @location = Location.create(location_params)
        
            if @location.save
                redirect_to location_path(@location)
            else
                render 'locations/new'
            end 
          end  
           
    end 


    def show
    end 

    def edit 
    end 

    def update
        if @user.locations.include?(@location)
            @r = Review.find_by(location_id: @location, user_id: @user)
           
            params[:location][:country] = capitalize_location(params[:location][:country])
            params[:location][:state] = params[:location][:state].upcase
            params[:location][:city] = capitalize_location(params[:location][:city])

            @new = Location.create(location_params)
            
            if @new.save
                @new.reviews << @r 
                redirect_to location_path(@new)
            else 
                @location = @new
                render 'locations/edit'
            end 
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

    def set_location
        @location = Location.find_by(id: params[:id]) || @location = Location.find_by(params[:id])
    end 

    def set_user
        @user = User.find_by(id: current_user)
    end 
   
end 


