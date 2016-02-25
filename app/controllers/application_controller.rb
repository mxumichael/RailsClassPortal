class SecurityTransgression < StandardError; end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from SecurityTransgression, with: :user_not_authorized
  def user_not_authorized
    flash[:error] = 'You don\'t have access to this section.'
    back_or_welcome
  end
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def record_not_found
    flash[:error] = 'Resource not found.'
    back_or_welcome
  end
  rescue_from ActionController::RedirectBackError, with: :back_not_found
  def back_not_found
    redirect_to welcome_index_path
  end

  private
  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to access this section'
      redirect_to welcome_index_path
    end
  end
  def back_or_welcome
    request.env['HTTP_REFERER'].present? ? (redirect_to :back) : (redirect_to welcome_index_path)
  end
end
