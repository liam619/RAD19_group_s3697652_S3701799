class Course < ApplicationRecord

  belongs_to :user

  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :prerequisites

  validates :name, presence: true
  validates :description, presence: true
  validates :categories, presence: true
  validates :locations, presence: true
  mount_uploader :image, ImageUploader
  validate :image_size

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end
