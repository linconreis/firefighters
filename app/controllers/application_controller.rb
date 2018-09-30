class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #helpers personalisados
  helper_method :firefighter_session?, :get_firefighter_session

  #adicionar usuário na sessão
  def add_firefighter_session(registration)
  	session[:current_firefighter_registration] = registration
  end

  #buscar usuário da sessão
  def get_firefighter_session
  	if Firefighter.exists?(:registration => session[:current_firefighter_registration])
  		return Firefighter.find_by registration: session[:current_firefighter_registration]
  	else
  		return nil
  	end
  end

  #verificar presença de usuário na sessão
  def firefighter_session?
  	session[:current_firefighter_registration].present?
  end

  #destruir sessão
  def destroy_firefighter_session
  	session[:current_firefighter_registration] = nil
  end

  def authenticate
    unless firefighter_session?
      redirect_to controller: "welcome"
      flash[:info] = "Você não tem permissão"
    end
  end

  def authenticate_commandant
    if firefighter_session?
      firefighter = get_firefighter_session
        if firefighter.commandant == false
          redirect_to controller: "welcome"
          flash[:info] = "Você não tem permissão"
        end
    else
      redirect_to controller: "welcome"
      flash[:info] = "Você não tem permissão"
    end   
  end


end
