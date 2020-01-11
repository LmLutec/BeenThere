class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :location 

    has_many :comments
    has_many :commenters, through: :comments, source: :user 
    
    validates :occasion, :satisfaction, :revisit, :living, :stay_length, :food_rating, :events, :cost_level, :suggest, :additional_info, presence: true
    
   
 
end


