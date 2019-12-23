class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :location 
    
    validates :occasion, :satisfaction, :revisit, :living, :stay_length, :food_rating, :events, :cost_level, presence: true
    
   
 
end


