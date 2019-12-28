class Location < ApplicationRecord

    has_many :reviews
    has_many :users, through: :reviews


    validates :city, :state, :country, presence: true
    #validates :city, :state, :country, :uniqueness => { case_sensitive: false }


  
  

    def review=(review)
        self.reviews.build(review) 
    end 
  
end
