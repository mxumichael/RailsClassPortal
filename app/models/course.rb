class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :materials
  validates :course_number, :title, :start_date, :end_date, :status, presence: true

  def self.search(query)
    if query
      find(:all, :conditions => ['course_number LIKE ?', "%#{query}%"])
    else
      find(:all)
    end
  end
  def can_be_created_by?(user)
    user.admin?
  end
  def can_be_destroyed_by?(user)
    user.admin?
  end
  def can_be_updated_by?(user)
    user.admin? or user == self
  end
  def can_be_read_by?(user)
    user.admin? or user == self or user.student? or user.instructor
  end

end