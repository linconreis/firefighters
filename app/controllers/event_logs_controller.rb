class EventLogsController < ApplicationController

  def index
    #@event_logs = EventLog.order(:date).all
    @event_logs = EventLog.order(date: :desc).where :occurrence_type => params[:type_occurrence_id]
    @type_occurrence = OccurrenceType.find(params[:type_occurrence_id])

  end

  def index_all
    @event_logs = EventLog.order(date: :desc).all
  end

  def new
    @event_log = EventLog.new
    @firefighters = Firefighter.order(:name).all
    @cars = Car.order(:name).all
    @adresses = Address.order(:name).all
    
    #buscar o tipo de ocorrencia no titulo do cadastro
    @type_occurrence = OccurrenceType.find(params[:type_occurrence_id])
  end

  def create
    firefighters = Firefighter.where id: params[:firefighters]
    cars = Car.where id: params[:cars]
    @type_occurrence = OccurrenceType.find(params[:type_occurrence_id])

    address = Address.find(params[:address][:id])
 
    @event_log = EventLog.new(event_log_params)

    @event_log.firefighters = firefighters
    @event_log.cars = cars
    @event_log.address = address 
    @event_log.occurrence_type = @type_occurrence


    if @event_log.save
      redirect_to controller: "event_logs"
      flash[:success] = "Cadastrado com sucesso"
    else
      @firefighters = Firefighter.order(:name).all
      @cars = Car.order(:name).all
      @adresses = Address.order(:name).all
      render :new
      flash[:danger] = "Opss! Algo deu errado!"
    end
  end

  def show
    @event_log = EventLog.find(params[:id])
  end

  def edit
    @event_log = EventLog.find(params[:id])
    @firefighters = Firefighter.order(:name).all
    @cars = Car.order(:name).all
    @adresses = Address.order(:name).all
  end

  def update
    firefighters = Firefighter.where id: params[:firefighters]
    cars = Car.where id: params[:cars]
    @type_occurrence = OccurrenceType.find(params[:type_occurrence_id])

    address = Address.find(params[:address][:id])
 
    @event_log = EventLog.find(params[:id])

    @event_log.firefighters = firefighters
    @event_log.cars = cars
    @event_log.address = address 
    @event_log.occurrence_type = @type_occurrence

    if @event_log.update(event_log_params)
      redirect_to controller: "event_logs"
      flash[:success] = "Atualizado com sucesso!"
    else
      render :edit
      flash[:danger] = "Opss! Algo deu errado"
    end
  end

  def destroy
    @event_log = EventLog.find(params[:id])
    @event_log.destroy
    redirect_to controller: "event_logs"
    flash[:success] = "Excluído com sucesso"
  end

  private

  def event_log_params
    params.require(:event_log).permit(:date, :exit_time, :return_time, :requester, :phone, :descriptive_memorial, :measures_taken, :comments, :climate_conditions, :finished, :number)
  end

end
