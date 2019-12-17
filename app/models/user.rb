class User < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :vacations, through: :reviews

    validates :first_name, :last_name, :age, :email, :password, presence: true 
    validates :email, uniqueness: true 
    
end
