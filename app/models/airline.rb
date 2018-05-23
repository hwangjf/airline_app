class Airline < ApplicationRecord
  has_many :flights
  has_many :destinations, through: :flights

  validates :name, presence: true, uniqueness: true
end
