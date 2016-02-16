class Enrollment < ActiveRecord::Base
  has_many :users
  has_many :courses

  validates_uniqueness_of :user_id, :scope => :course_id
end
