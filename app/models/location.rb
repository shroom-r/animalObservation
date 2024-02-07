class Location < ApplicationRecord
    has_many :observations, dependent: :destroy

    validates :name, presence: true
end
