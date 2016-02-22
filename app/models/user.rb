class User < ActiveRecord::Base
  has_many :enrollments

  validates :name, presence: true
  validates :email, uniqueness: true

  has_secure_password

  validates :password,
            :length => { :minimum => 8, :if => :validate_password? },
            :confirmation => { :if => :validate_password? }

  private

  def validate_password?
    password.present? || password_confirmation.present?
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        User.model_name
      end
    end
    super
  end
end

