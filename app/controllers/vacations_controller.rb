class VacationsController < ApplicationController

    def new
        @vacation = Vacation.new
    end 

    def create
        @vacation = Vacation.create(vacation_params)
        redirect_to vacation_path(@vacation)
    end 

    def show
    end 




    private

    def vacation_params
        params.require(:vacation).permit(:occasion, :start_date, :end_date, :city, :state, :country, :user_id, :transportation_id, :review_id)
    end 
end


