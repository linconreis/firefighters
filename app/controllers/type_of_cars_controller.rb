class TypeOfCarsController < ApplicationController
  before_action :authenticate_commandant

	def index
		@type_of_cars = TypeOfCar.order(:name).all
	end

	def new
		@type_of_car = TypeOfCar.new
	end

	def create
		@type_of_car = TypeOfCar.new(type_of_car_params)

		if @type_of_car.save
			redirect_to controller: "type_of_cars"
			flash[:success] = "Cadastrado com sucesso"
		else
			render :new
			flash[:danger] = "Opss! Algo deu errado"
		end
	end

	def edit
		@type_of_car = TypeOfCar.find(params[:id])
	end

	def update
		@type_of_car = TypeOfCar.find(params[:id])
		
		if @type_of_car.update(type_of_car_params)
			redirect_to controller: "type_of_cars"
			flash[:success] = "Atualizado com sucesso"
		else
			render :edit
			flash[:danger] = "Opss! Algo deu errado"
		end
	end

	def destroy
		@type_of_car = TypeOfCar.find(params[:id])
		@type_of_car.destroy
		redirect_to controller: "type_of_cars"
		flash[:success] = "Excluído com sucesso"
	end

	private

		def type_of_car_params
			params.require(:type_of_car).permit(:name)			
		end

end
