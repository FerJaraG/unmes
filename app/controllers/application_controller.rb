class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :allow_iframe

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)    
      super
    else
      my_courses_courses_path
    end
  end

  def set_admin_locale
    I18n.locale = :en
  end

  def allow_iframe
  	response.headers.except! 'X-Frame-Options'
  end    
  
end
