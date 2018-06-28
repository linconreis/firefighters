class AuthController < ApplicationController
require 'digest'

  def index
    if firefighter_session?
      flash[:info] = "Você já está conectado :)"
      redirect_to controller: "welcome"
    end
  end

  def sign_in
  	registration = params[:firefighter][:registration]
  	password = params[:firefighter][:password]
  	firefighter = Firefighter.find_by registration: registration

  	if firefighter.present?
  		if firefighter.password == Digest::SHA256.hexdigest(password)
        if firefighter.renew_password == true
          add_firefighter_session(firefighter.registration)
          redirect_to controller: "auth", action: "change_password"
          flash[:info] = "Primeiro acesso, favor alterar a senha"
        else
          add_firefighter_session(firefighter.registration)
          redirect_to controller: "welcome"
        end
  		else
  			flash[:warning] = "Senha inválida!"
  			redirect_to controller: "auth"
  		end
  	else
  		flash[:warning] = "Usuário não encontrado :("
  		redirect_to controller: "auth"
  	end
  end

  def logout
    destroy_firefighter_session
    flash[:success] = "Você foi desconectado com sucesso!"
    redirect_to controller: "welcome"
  end

  def change_password
    firefighter = Firefighter.find(get_firefighter_session.id)
  end

  def redefine
    firefighter = Firefighter.find(get_firefighter_session.id)
    firefighter.password = Digest::SHA256.hexdigest params[:firefighter][:password]
    firefighter.renew_password = false
    if firefighter.save
      destroy_firefighter_session
      flash[:success] = "Senha alterada com sucesso, favor reconectar!"
      redirect_to controller: "welcome"
    end
  end


end
