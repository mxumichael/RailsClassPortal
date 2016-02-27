class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  validates_uniqueness_of :user_id, :scope => :course_id

  def self.multiple_instructors?(id)
    instructor_enrollments = Enrollment.where('course_id = ?', id)
    count = 0
    instructor_enrollments.each do |enrollment|
      if enrollment.user && (enrollment.user.is_a? Instructor)
        count += 1
      end
    end
    return count > 1
  end

  def self.can_be_created_by?(user)
    user.user?
  end
  def can_be_created_by?(user)
    user.user?
  end
  def can_be_destroyed_by?(user)
    user == this[user] or !user.student?
  end
  def can_be_updated_by?(user)
    false
  end
  def self.can_be_read_by?(user)
    user.self? or !user.student?
  end
  def can_be_read_by?(user)
    user.self? or !user.student?
  end
end
