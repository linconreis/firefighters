class DistrictsController < ApplicationController

	def index
		 @districts = District.order(:name).all
	end

	def new
		@district = District.new
	end

	def create
		@district = District.new(district_params)

		if @district.save
			redirect_to controller: "districts"
			flash[:success] = "Cadastrado com sucesso"
		else
			render :new
			flash[:danger] = "Opss! Algo deu errado!"
		end
	end

	def edit
		@district = District.find(params[:id])
	end

	def update
		@district = District.find(params[:id])
		if @district.update(district_params)
			redirect_to controller: "districts"
			flash[:success] = "Atualziado com sucesso"
		else
			render :edit
			flash[:danger] = "Opss! Algo deu errado"			
		end
	end

	def destroy
		@district = District.find(params[:id])
		@district.destroy
		redirect_to controller: "districts"
		flash[:success] = "Excluído com sucesso"
	end

	private
	
		def district_params
			params.require(:district).permit(:name)
		end

end
