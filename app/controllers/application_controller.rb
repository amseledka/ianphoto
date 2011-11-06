# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  layout "application"
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

#  before_filter :load_static_pages, :require_authentication_for_admin
  before_filter :set_locale
  helper_method :current_user_session, :current_user
  before_filter :mailer_set_url_options
  after_filter :collect_errors
 
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

    def set_locale
      I18n.locale = params[:locale] # || I18n.default_locale
    end
    
    def mailer_set_url_options
      ActionMailer::Base.default_url_options[:host] = request.host_with_port
    end
  
    def collect_errors
      @errors = [@user, @photo, @category, @invite, @static_page].map {|instance|
        if instance && instance.errors
          instance.errors.full_messages
        else
          nil
        end
      }.compact.flatten
      return if @errors.blank?
      @errors.map!(&:strip)
      @errors.reject! {|e| e.blank?}
      flash[:error] = @errors.join("<br>") if @errors
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
