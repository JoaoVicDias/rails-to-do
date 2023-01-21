# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_user_logged_in!, only: %i[destroy]
  before_action :require_user_logged_out, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:expired_at] = Time.current + 24.hours
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    logged_out_handler
  end
end
