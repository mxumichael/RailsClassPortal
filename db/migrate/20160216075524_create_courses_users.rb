class CreateCoursesUsers < ActiveRecord::Migration
  def self.up
    create_table :courses_users, :id => false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index:true
    end
  end

  def self.down
    drop_table :courses_users
  end
end
