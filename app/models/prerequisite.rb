class Prerequisite < ApplicationRecord

  has_and_belongs_to_many :courses

  def name
    Course.find_by(id: self.id).name
  end
end
