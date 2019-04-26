class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
