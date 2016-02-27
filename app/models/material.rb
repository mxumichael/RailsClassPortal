class Material < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true
  validates :category, presence: true
  def self.can_be_created_by?(user)
    !user.student?
  end
  def can_be_created_by?(user)
    !user.student?
  end
  def can_be_destroyed_by?(user)
    !user.student?
  end
  def can_be_updated_by?(user)
    !user.student?
  end
  def self.can_be_read_by?(user)
    !user.student?
  end
  def can_be_read_by?(user)
    !user.student?
  end
end
