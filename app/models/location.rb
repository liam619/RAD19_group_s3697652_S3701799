class Location < ApplicationRecord

  has_and_belongs_to_many :courses

  VALID_LOCATION = /\A[\d]{2}+\.[\d]{2}+\.[\d]{2}\z/
  validates :name, presence: true, length: { is: 8, wrong_length: " min/max 8 character!" }, format: { with: VALID_LOCATION, message: " must be in format 00.00.00" }
end
