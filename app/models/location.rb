class Location < ApplicationRecord

    has_many :reviews
    has_many :users, through: :reviews

    # attr_accessor :reviews
    # accepts_nested_attributes_for :reviews


    validates :city, :state, :country, presence: true 


  
  

    def review=(review)
        self.reviews.build(review) 
    end 


  
  
end
