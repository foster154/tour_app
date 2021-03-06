class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  	dashboard_path # takes user to dashboard after signing in (instead of root)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :stripe_token, :coupon) }
  end

  # def blog
  #   redirect_to "https://brandfolder.com/blog#{request.fullpath.gsub('/blog','')}", :status => :moved_permanently
  # end

end
