class CreateCoursesPrerequisite < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_prerequisites do |t|
      t.integer :course_id
      t.integer :prerequisite_id
    end
  end
end
