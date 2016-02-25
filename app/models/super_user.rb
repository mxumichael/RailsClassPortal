class SuperUser < Admin
  def super_user?
    true
  end
  def can_be_created_by?(user)
    false
  end
  def can_be_destroyed_by?(user)
    false
  end
  def can_be_updated_by?(user)
    user == self
  end
  def can_be_read_by?(user)
    user == self
  end
end
