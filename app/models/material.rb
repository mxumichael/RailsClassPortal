class Material < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true
  validates :category, presence: true
end
