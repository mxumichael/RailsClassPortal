class User < ActiveRecord::Base
  has_many :enrollments

  validates :name, presence: true
  validates :email, :presence => true, :uniqueness => true

  has_secure_password

  validates :password,
            :length => { :minimum => 8, :if => :validate_password? },
            :confirmation => { :if => :validate_password? }

  def admin?
    false
  end
  def super_user?
    false
  end
  def instructor?
    false
  end
  def student?
    false
  end
  def user?
    true
  end

  def can_create?(resource)
    resource.can_be_created_by?(self)
  end
  def can_destroy?(resource)
    resource.can_be_destoyed_by?(self)
  end
  def can_update?(resource)
    resource.can_be_updated_by?(self)
  end
  def can_read?(resource)
    resource.can_be_read_by?(self)
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        User.model_name
      end
    end
    super
  end


  private

  def validate_password?
    password.present? || password_confirmation.present?
  end


end

