class User < ApplicationRecord
    has_secure_password

    has_many :vacations
    has_many :reviews, through: :vacations
    has_many :transportations, through: :vacations

    validates :first_name, :last_name, :email, :password, presence: true 
    validates_uniqueness_of :email, :case_sensitive => false
    
end
