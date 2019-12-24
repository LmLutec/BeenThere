class LocationsController < ApplicationController
    include LocationsHelper

    before_action :require_login


    def index
        @locations = Location.all 
       
    end 

    def new
        @location = Location.new  
        @user = User.find_by(id: session[:user_id])
        @location.reviews.build(params[:reviews_attributes]) 
    end 

    def create
        @new_location = "#{params[:location][:country]}, #{params[:location][:state]}, #{params[:location][:city]}"        
       
        @location = Location.create(location_params)
        
        location_match(@new_location)
       
       byebug
        if @location.save 
            redirect_to location_path(@location)
        else 
            flash[:notice] = "Fill out all fields"
            redirect_to new_location_path 
        end 
    end 


    def show
        @location = Location.find_by(id: params[:id])
    end 

    def edit 
        @location = Location.find_by(id:params[:id])
        @user = User.find_by(id: session[:user_id])
    end 

    def update
        @location = Location.find_by(id: params[:id])
        @location.update(location_params) 
        redirect_to location_path(@location)
    end 



    private

    def location_params
        params.require(:location).permit(:city, :state, :country, :user_id, :reviews_attributes => [:location_id, :user_id, :occasion, :satisfaction, :revisit, :suggest, :living, :stay_length, :food_rating, :events, :comments, :cost_level])
    end 

    def require_login
        unless session[:user_id]
            redirect_to root_path 
        end 

    end
end 


