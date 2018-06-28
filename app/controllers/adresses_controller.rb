class AdressesController < ApplicationController
  
  def index
  	@adresses = Address.where :district => params[:district_id]
  	@district = District.find(params[:district_id])
  end

  def new
  	@address = Address.new
    #puxar o bairro em que a rua está sendo cadastrada
    @district = District.find(params[:district_id])
  end

  def create
  	district = District.find(params[:district_id])
  	@address = Address.new(address_params)
  	@address.district = district

  	if @address.save
  		redirect_to controller: "adresses"
  		flash[:success] = "Cadastrado com sucesso"
  	else
  		render :new
  		flash[:danger] = "Opss! Algo deu errado"
  	end
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])

    if @address.update(address_params)
      redirect_to controller: "adresses"
      flash[:success] = "Atualizado com sucesso"
    else
      render :edit
      flash[:danger] = "opss! Algo deu errado"
    end

  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to controller: "adresses"
    flash[:success] = "Excluído com sucesso"
  end

	private

		def address_params
			params.require(:address).permit(:name, :hydrant, :reference_point)
		end

end
