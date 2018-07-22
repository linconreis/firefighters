class PluviometersController < ApplicationController

	def index
    #cuidar os pontos na ordenacao de data - decrescente desc - crescente asc
		@pluviometers = Pluviometer.order(date: :desc).all
	end

	def new
		@pluviometer = Pluviometer.new
	end

	def create
		@pluviometer = Pluviometer.new(pluviometer_params)
		@pluviometer.firefighter = get_firefighter_session

			if @pluviometer.save
				redirect_to controller: "pluviometers"
				flash[:success] = "Cadastrado com sucesso"
			else
				render :new
				flash[:danger] = "Opss! Algo deu errado"
			end
	end

	def edit
		@pluviometer = Pluviometer.find(params[:id])
	end

	def update
		@pluviometer = Pluviometer.find(params[:id])
		@pluviometer.firefighter = get_firefighter_session

		if @pluviometer.update(pluviometer_params)
			redirect_to controller: "pluviometers"
			flash[:success] = "Atualizado com sucesso"
		else
			render :edit
			flash[:danger] = "Opss! Algo deu errado"
			
		end
	end

	def destroy
		@pluviometer = Pluviometer.find(params[:id])
		@pluviometer.destroy
		redirect_to controller: "pluviometers"
		flash[:success] = "Excluído com sucesso"
	end

	private
		def pluviometer_params
			params.require(:pluviometer).permit(:last_twenty_four, :last_forty_eight, :date, :note)
		end

end
