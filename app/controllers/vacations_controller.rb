class VacationsController < ApplicationController
    before_action :require_login

    def new
        @vacation = Vacation.new
    end 

    def create
        @user = User.find_by(id: session[:user_id])
        @vacation = @user.vacations.build 
        byebug
        @review = @vacation.review.create 
        @vacation.save
    end 

    def show
    end 




    private

    def vacation_params
        params.require(:vacation).permit(:occasion, :start_date, :end_date, :city, :state, :country)
    end 

    def require_login
        unless session[:user_id]
            redirect_to root_path 
        end 

    end
end 


