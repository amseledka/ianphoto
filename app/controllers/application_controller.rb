# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  layout "application"

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

#  before_filter :load_static_pages, :require_authentication_for_admin
  helper_method :current_user_session, :current_user

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  protected
    def load_static_pages
      @static_pages = StaticPage.all
    end
    
=begin
    def require_authentication_for_admin
      if self.class.name.split("::").first.eql?("Admin")
        authenticate_or_request_with_http_basic do |username, password|
          username == SHADOW["username"] && password == SHADOW["password"]
        end
      end
    end
=end
end
