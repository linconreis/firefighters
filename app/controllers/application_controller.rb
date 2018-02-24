class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def add_firefighter_session(registration)
  	session[:current_firefighter_registration] = registration
  end
end
