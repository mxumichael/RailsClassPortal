class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  validates_uniqueness_of :user_id, :scope => :course_id

  def multiple_instructors?
    @instructor_enrollments = Enrollment.where('course_id = ?', self.id)
    count = 0
    @instructor_enrollments.each do |enrollment|
      if enrollment.user && enrollment.user.is_instructor
        count += 1
      end
    end
    return count > 1
  end
end
