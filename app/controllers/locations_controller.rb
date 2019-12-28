class LocationsController < ApplicationController
    include LocationsHelper
    include ReviewsHelper
    include CommentsHelper

    before_action :require_login
    before_action :location_count


    def index
        @locations = Location.all 
        #add_by_location(@locations)
    end 

    def new
        @location = Location.new  
        @user = User.find_by(id: session[:user_id]) 
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
            #     params.permit!
            #     review = Review.create(params["location"]["review"])
            #     @location.reviews << review 
            #     redirect_to location_review_path(@location,review)
            # elsif !@location  
            #     @location = Location.create(location_params)
            #     redirect_to location_path(@location)
            # else 
            #     flash[:notice] = "Fill out all fields"
            #     redirect_to new_location_path
            # end 
    end 


    def show
        @location = Location.find_by(id: params[:id])
    end 

    def edit
        @user = User.find_by(id: session[:user_id])
        @location = Location.find_by(id: params[:id])
        # @review = Review.find_by(id: params[:id])
        # if @user == @review.id 
        #     @location = @review.location
        # end
    
    end 

    def update
        @location = Location.find_by(id: params[:id])
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

   
end 


