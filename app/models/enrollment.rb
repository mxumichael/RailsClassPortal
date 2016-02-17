class Enrollment < ActiveRecord::Base
  has_many courses
  has_many users

  validates_uniqueness_of :user_id, :scope => :course_id
end
