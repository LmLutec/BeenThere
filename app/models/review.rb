class Review < ApplicationRecord
    belongs_to :vacation


    def options_for_satisfaction
        options_for_satisfaction = ["The most fun I've had in a while", "I was able to relax, and that was the point", "Could have been better", "eh"]
    end 
end
