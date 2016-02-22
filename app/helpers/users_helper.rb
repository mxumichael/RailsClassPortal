module UsersHelper

  def is_student?(user)
    user.is_student?
  end

  def is_instructor?(user)
    user.is_instructor?
  end
end
