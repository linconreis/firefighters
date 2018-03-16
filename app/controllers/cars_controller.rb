class CarsController < ApplicationController

	def index
		@cars =  Car.where :type_of_car => params[:type_of_car_id]
		@type_of_car = TypeOfCar.find(params[:type_of_car_id])
	end

	def new
		@car = Car.new
	end

	def create
		type_of_car = TypeOfCar.find(params[:type_of_car_id])
		@car = Car.new(car_params)
		@car.type_of_car = type_of_car

		if @car.save
			redirect_to controller: "cars"
			flash[:success] = "Cadastrado com sucesso"
		else
			render :new
			flash[:danger] = "Opss! Algo deu errado"
		end
	end

	def edit
		@car = Car.find(params[:id])
	end

	def update
		@car = Car.find(params[:id])

		if @car.update(car_params)
			redirect_to controller: "cars"
			flash[:success] = "Atualizado com sucesso"
		else
			render :edit
			flash[:danger] = "Opss! Algo deu errado"
		end
	end

	def destroy
		@car = Car.find(params[:id])
		@car.destroy
		redirect_to controller: "cars"
		flash[:success] = "Excluído com sucesso"
	end


	private

		def car_params
			params.require(:car).permit(:brand, :name, :board, :mileage, :year)
		end

end
