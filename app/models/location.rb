class Location < ApplicationRecord
    has_many :observations, dependent: :destroy
    before_validation :normalize_fields

    validates :name, presence: true, uniqueness: true

    def normalize_fields
      self.name = name.strip.squeeze(" ").gsub(/[^a-zA-ZÀ-ú0-9' -]/, "").capitalize
    end
end
