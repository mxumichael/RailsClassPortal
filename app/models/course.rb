class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :users

  validates :course_number, :title, :start_date, :end_date, :status, presence: true
end