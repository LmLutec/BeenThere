class User < ApplicationRecord
    has_secure_password
    
    has_many :vacations
    has_many :reviews
    has_many :transportations, through: :vacations
end
