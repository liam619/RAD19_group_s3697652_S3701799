class CreateCategoriesCourse < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_courses do |t|
      t.integer :course_id
      t.integer :category_id
    end
  end
end
