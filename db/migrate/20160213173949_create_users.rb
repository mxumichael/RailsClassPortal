class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :is_student
      t.boolean :is_instructor
      t.string :type

      t.timestamps
    end
  end
end

