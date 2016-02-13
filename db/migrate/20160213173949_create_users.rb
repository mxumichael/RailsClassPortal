class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :is_student
      t.boolean :is_admin
      t.boolean :is_instructor

      t.timestamps
    end
  end
end
