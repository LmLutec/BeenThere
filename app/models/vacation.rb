class Vacation < ApplicationRecord
    belongs_to :user
    belongs_to :transportation
    has_one :review

    accepts_nested_attributes_for :review
end
