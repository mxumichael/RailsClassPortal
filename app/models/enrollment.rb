class Enrollment < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :courses

  validates_uniqueness_of :user_id, :scope => :course_id
end
