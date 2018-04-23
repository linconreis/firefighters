class FirefightersController < ApplicationController
	require "digest"

	def index
		@firefighters = Firefighter.order(:name).all
	end

	def new
		@firefighter = Firefighter.new
	end

	def create
		@firefighter = Firefighter.new(firefighter_params)
		@firefighter.password = 12345

		if @firefighter.save
			redirect_to controller: "firefighters"
			flash[:success] = "Cadastrado com sucesso"
		else
			render :new
			flash[:danger] = "Opss! Algo deu errado"
		end
	end

	def show
		@firefighter = Firefighter.find(params[:id])
	end

	def edit
		@firefighter = Firefighter.find(params[:id])
	end

	def update
		@firefighter = Firefighter.find(params[:id])

		if @firefighter.update(firefighter_params)
			redirect_to controller: "firefighters"
			flash[:success] = "Atualizado com sucesso"
		else
			render :edit
			flash[:danger] = "Opss! Algo deu errado"
		end
	end

	def destroy
		@firefighter = Firefighter.find(params[:id])
		@firefighter.destroy
		redirect_to controller: "firefighters"
		flash[:success] = "Excluído com sucesso"		
	end

	private

		def firefighter_params
			params.require(:firefighter).permit(:name, :last_name, :phone, :commandant, :type_blood, :password, :email, :registration, :birth_date, :renew_password)
		end

end
