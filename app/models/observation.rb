class Observation < ApplicationRecord
  belongs_to :location
  before_validation :normalize_fields

  validates :animalName, presence: true, length: { minimum: 2 }

  def normalize_fields
    self.animalName = animalName.strip.squeeze(" ").gsub(/[^a-zA-ZÀ-ú0-9' -]/, "").capitalize
  end
end
