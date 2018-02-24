class AuthController < ApplicationController
require 'digest'

  def index
  end

  def sign_in
  	registration = params[:firefighter][:registration]
  	password = params[:firefighter][:password]
  	firefighter = Firefighter.find_by registration: registration

  	if firefighter.present?
  		if firefighter.password == Digest::SHA256.hexdigest(password)
  		add_firefighter_session(firefighter.registration)
  		redirect_to controller: "welcome"
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
end
