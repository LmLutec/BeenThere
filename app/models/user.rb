class User < ApplicationRecord
    has_secure_password

    has_many :vacations
    has_many :transportations, through: :vacations

    validates :first_name, :last_name, :age, :email, :password, presence: true 
    validates :email, uniqueness: true 
    
end
