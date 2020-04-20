class Location < ApplicationRecord

    has_many :reviews
    has_many :users, through: :reviews


    validates :city, :state, :country, presence: true
    validates :state, length: {is: 2}


  
  

    def review=(review)
        self.reviews.build(review) 
    end 
  
end
