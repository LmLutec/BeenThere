class Location < ApplicationRecord
    before_save :capitalize_all 

    has_many :reviews
    has_many :users, through: :reviews


    validates :city, :state, :country, presence: true


  
  

    def review=(review)
        self.reviews.build(review) 
    end 


    def capitalize_all
        self.country.capitalize 
        self.state.capitalize
        self.city.capitalize
    end 
  
end
