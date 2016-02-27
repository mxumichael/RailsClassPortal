class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :materials
  validates :title, :start_date, :end_date, :status, presence: true
  validates :course_number, numericality: { only_integer: true }, presence: true

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
    user.admin? or user.instructor?
  end
  def can_be_read_by?(user)
    user.user?
  end

  def self.status_options
    @options = %w(Active Inactive)
  end

end