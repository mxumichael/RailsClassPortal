class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_number
      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end

    create_table :students_courses do |t|
      t.belongs_to :student
      t.belongs_to :course
    end

    create_table :instructors_courses do |t|
      t.belongs_to :instructor
      t.belongs_to :course
    end
  end
end
