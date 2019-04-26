class CreatePrerequisites < ActiveRecord::Migration[5.1]
  def change
    create_table :prerequisites do |t|

      t.timestamps
    end
  end
end
