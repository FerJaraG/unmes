class User < ActiveRecord::Base
  FUNNEL_STATES = ["lead", "user", "active", "close"]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :consumes
  has_many :workshops, :through => :consumes
  has_many :inscriptions
  has_many :courses, :through => :inscriptions
  
  scope :onlines, -> { where online: true }
  scope :offlines, -> { where online: false }
  scope :group_by_week, -> { group_by(&:week).sort }

  before_create { |user| user.funnel = User::FUNNEL_STATES[0]}

  #->Prelang (user_login/devise)
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    # The User was found in our database
    return user if user

    # Check if the user is already registered without facebook
    user = User.where(email:auth.info.email).first
    return user if user

    # The User was not found and we need to create them
    User.create(name:     auth.extra.raw_info.name,
                provider: auth.provider,
                uid:      auth.uid,
                email:    auth.info.email,
                password: Devise.friendly_token[0,20])  

  end


  def consume(workshop)
  	unless self.consumes.collect(&:workshop_id).include? workshop.id 
		readed = self.consumes.build(:workshop => workshop, :q => 1)
  		readed.save	
  	else
  		c = self.consumes.where(:workshop_id => workshop.id).first # there shall be only one
  		c.q = c.q + 1
  		c.save
  	end
  end

  def paid?
    return self.paid
  end

  def last_workshop
    self.workshops.order('place desc').first
  end


  def crossworkshop
    Workshop.sorted.map do |w|
      self.workshops.include?(w) ? w.name + " <span style='color:green'> √ </span>": w.name + "<span style='color:red'> x </span>" + Rails.application.routes.url_for(:controller => 'workshops', :action => 'show', :id => w.id, :host => "www.en1mes.com")
    end
  end

  def has_paid_course?(course)
    inscription = (self.inscriptions & course.inscriptions) # should be array with one element or empty array
    if inscription.empty?
      return false
    else
      if inscription.first.paid == true
        return true
      else
        return false
      end
    end
  end

  def week
    self.created_at.strftime('%W')
  end

  def month
    self.created_at.strftime('%m')
  end

end 
