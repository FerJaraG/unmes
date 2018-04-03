class Chapter < ActiveRecord::Base
  scope :sorted, -> { order('place ASC')}
  has_many :workshops
  belongs_to :course
end
