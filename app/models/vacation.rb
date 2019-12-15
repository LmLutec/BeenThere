class Vacation < ApplicationRecord
    belongs_to :user
    belongs_to :transportation
    has_many :reviews

    accepts_nested_attributes_for :reviews
end
