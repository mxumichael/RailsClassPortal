class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title
      t.string :description
      t.string :category
      t.integer :course_id

      t.timestamps
    end
  end
end
