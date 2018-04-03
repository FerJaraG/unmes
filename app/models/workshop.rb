class Workshop < ActiveRecord::Base
  has_many :consumes
  has_many :users, :through => :consumes
  belongs_to :chapter
  has_one :course, :through => :chapter # technically is a belong_to

  scope :sorted, -> { order('place ASC').where('hidden = ?', false) }
  scope :previous_than, -> (x) { where('workshops.place < ?', x)}
  scope :greater_than, -> (x) { where('workshops.place > ?', x)}

  paginates_per 10


  after_initialize :default_values
  def default_values
    self.place ||= 1
  end

  # def previous_workshop
  #   self.class.previous_than(self.place).where(:hidden => false).order("place desc").first
  #   #self.class.first(:conditions => ["place < ? and hidden = ?", place, false], :order => "place desc")
  # end

  def previous_workshop
    course = self.chapter.course
    course.workshops.previous_than(self.place).where(:hidden => false).order("place desc").first
  end

  def next_workshop
    course = self.chapter.course
    course.workshops.greater_than(self.place).where(:hidden => false).order("place asc").first
  end

  def public?
    return self.public
  end

  def stucks
    if self.next_workshop.nil?
      return []
    else  
      self.users - self.next_workshop.users
    end
  end

  def consumed_by(user)
    if self.users.include?(user)
      return true
    else
      return false
    end
  end



end
