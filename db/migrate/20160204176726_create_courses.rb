class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_number
      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date
      t.boolean :is_active #status

      t.timestamps
    end

    if not table_exists?(:students_courses)
      create_table :students_courses do |t|
        t.belongs_to :student
        t.belongs_to :course
      end
    end


    create_table :courses_instructors do |t|
      t.belongs_to :instructor
      t.belongs_to :course
    end
  end
end
