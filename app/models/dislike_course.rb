class DislikeCourse < ApplicationRecord
  belongs_to :course, class_name: "Course"
  belongs_to :user, class_name: "User"
end
