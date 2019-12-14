class TransportationsController < ApplicationController

    def new
        @transportation = Transportation.new 
    end 

    def create 
        @transportation = Transportation(transportation_params)
        redirect_to transportation_path(@transportation)
    end 

    def show
        @transportation = Transportation.find_by(id: params[:id])
    end 




    private

    def transportation_params
        params.require(:transportation).permit(:method, :time_to, :time_from, :cost_level, :from_city, :from_state, :from_country, :to_city, :to_state, :to_country) 
    end 
end


