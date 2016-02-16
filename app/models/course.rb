class Course < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :course_number, :title, :start_date, :end_date, :status, presence: true

  def self.search(query)
    if query
      find(:all, :conditions => ['course_number LIKE ?', "%#{query}%"])
    else
      find(:all)
    end
  end
end