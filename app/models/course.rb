class Course < ActiveRecord::Base
	has_many :chapters
	has_many :inscriptions
	has_many :users, :through => :inscriptions
	has_many :workshops, :through => :chapters
end
