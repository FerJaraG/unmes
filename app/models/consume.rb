class Consume < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop

  def month
    self.created_at.strftime('%m')
  end


end
