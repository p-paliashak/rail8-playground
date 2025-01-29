# frozen_string_literal: true

class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  rate_limit to: 10, within: 3.minutes, only: :create, with: lambda {
    redirect_to new_session_url, alert: "Try again later."
  }

  layout "session"

  def new
    redirect_to root_path if authenticated?
  end

  def create
    if (user = User.authenticate_by(params.permit(:email_address, :password)))
      start_new_session_for user
      respond_to do |format|
        format.html { redirect_to after_authentication_url }
        format.turbo_stream { redirect_to(after_authentication_url) }
      end
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end

  private

  def after_authentication_url(format: :html)
    root_path(format: format)
  end
end
