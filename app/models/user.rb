class User < ApplicationRecord
    has_secure_password

    has_many :vacations
    has_many :reviews, through: :vacations
    has_many :transportations, through: :vacations

    
end
