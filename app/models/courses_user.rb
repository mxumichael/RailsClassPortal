class Courses_user < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :courses

  #validates :approve, :deny, :grade, presence: true
  validates :user_id, :course_id, uniqueness: true


  def self.search(query)
    if query
      find(:all, :conditions => ['course_id LIKE ?', "%#{query}%"])
    else
      find(:all)
    end
  end
end