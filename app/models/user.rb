class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :locations, through: :reviews

    has_many :comments
    has_many :review_comments, through: :comments, source: :review 
    has_many :comments_received, through: :reviews, source: :comments 

    validates :first_name, :last_name, :age, :email, :password, presence: true 
    validates_uniqueness_of :email, :case_sensitive => false
    
end

