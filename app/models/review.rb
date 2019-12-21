class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :location 
    
    helper_method :by_location


    def by_location
        "location.country + location.state + location.city"
    end 

   
 
end
