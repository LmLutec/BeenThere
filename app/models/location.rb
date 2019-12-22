class Location < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :city, :state, :country, presence: true 

    accepts_nested_attributes_for :reviews

end
