class AbsencesController < ApplicationController
  before_action :authenticate
  before_action :authenticate_commandant, only: [:edit, :update, :destroy]

	def index
		@absences = Absence.order(date_out: :desc).all
	end

	def new
		@absence = Absence.new
		@firefighters = Firefighter.order(:name).all
		@cars = Car.order(:name).all
	end

	def create
    firefighters = Firefighter.where id: params[:firefighters]
    cars = Car.where id: params[:cars]
    @absence = Absence.new(absence_params)
    @absence.firefighters = firefighters
    @absence.cars = cars
		

    if @absence.mileage_return <= @absence.mileage_output
      @firefighters = Firefighter.order(:name).all
      @cars = Car.order(:name).all
      flash[:danger] = "Km de retorno menor que Km de saída"
      render :new
      return
    end

    if @absence.save
      redirect_to controller: "absences"
      flash[:success] = "Cadastrado com sucesso"
    else
      @firefighters = Firefighter.order(:name).all
      @cars = Car.order(:name).all
      render :new
      flash[:danger] = "Opss! Algo deu errado!"
    end

	end

	def edit
		@absence = Absence.find(params[:id])
    @firefighters = Firefighter.order(:name).all
    @cars = Car.order(:name).all
	end

	def update
    @absence = Absence.find(params[:id])

    @firefighters = Firefighter.where id: params[:firefighters]
    @cars = Car.where id: params[:cars]

    @absence.firefighters = @firefighters if @firefighters.present?
    @absence.cars = @cars if @cars.present?

    if params[:absence][:mileage_return] <= params[:absence][:mileage_output]
      @firefighters = Firefighter.order(:name).all
      @cars = Car.order(:name).all
      flash[:danger] = "Km de retorno menor que KM de saída"
      render :edit
      return
    end
    
    if @absence.update(absence_params)
      redirect_to controller: "absences"
      flash[:success] = "Atualizado com sucesso"
    else
      render :edit
      flash[:danger] = "Opss! Algo deu errado!"
    end
		
	end

  def show
    @absence = Absence.find(params[:id])    
  end

	def destroy
    @absence = Absence.find(params[:id])
    @absence.destroy
    redirect_to controller: "absences"
    flash[:success] = "Excluído com sucesso"		
	end

  private

    def absence_params
      params.require(:absence).permit(:justification, :exit_time, :return_time, :date_out, :return_date, :mileage_output, :mileage_return )
    end

end
