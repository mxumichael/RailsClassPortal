class AddRequestInactiveToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :request_inactive, :boolean, :default => false
  end
end
