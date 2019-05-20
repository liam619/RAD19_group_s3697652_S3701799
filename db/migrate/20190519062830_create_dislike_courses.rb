class CreateDislikeCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :dislike_courses do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
    add_index :dislike_courses, :user_id
    add_index :dislike_courses, :course_id
    add_index :dislike_courses, [:user_id, :course_id], unique: true
  end
end
