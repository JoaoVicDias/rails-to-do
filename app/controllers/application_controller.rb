# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    expired_at_time = session[:expired_at]
    return logged_out_handler if expired_at_time.present? && expired_at_time < Time.current

    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  private 

  def logged_in?
    current_user.present?
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in' unless logged_in?
  end

  def require_user_logged_out
    redirect_to posts_path if logged_in?
  end

  def logged_out_handler
    session[:user_id] = nil
    session[:expired_at] = nil
    redirect_to sign_in_path, notice: 'Logged Out'
  end
end
