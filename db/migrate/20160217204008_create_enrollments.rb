class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :approve
      t.boolean :deny
      t.integer :grade
    end
  end
end
