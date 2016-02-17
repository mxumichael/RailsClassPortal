class CreateCoursesUsers < ActiveRecord::Migration
  def change
    create_table :courses_users, :id=>false do |t|
      t.references :user, :course
      t.boolean :approve
      t.boolean :deny
      t.integer :grade

    end
  end
end
