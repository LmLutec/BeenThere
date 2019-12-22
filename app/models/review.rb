class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :location 
    
    validates_presence_of :occasion, :satisfaction, :revisit, :living, :stay_length, :food_rating, :events, :cost_level
    
   
 
end


