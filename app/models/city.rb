class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, 
    presence: true, 
    format: { with: /\d{5}(?:[-\s]\d{4})?/ } #https://stackoverflow.com/a/2577239
  has_many :users
  has_many :gossips
end
