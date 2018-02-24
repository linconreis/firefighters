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
  			render :login
  		end
  	else
  		flash[:warning] = "Usuário não encontrado :("
  		render :login
  	end
  end

end
