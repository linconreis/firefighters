class EventLogsController < ApplicationController

  def index
    @event_logs = EventLog.where :type_occurrence => params[:type_occurrence_id]
    @type_occurrence = OccurrenceType.find(params[:type_occurrence_id])

  end

  def new
    @event_log = EventLog.new
    @firefighters = Firefighter.order(:name).all
    @cars = Car.order(:name).all
    @adresses = Address.order(:name).all
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
    # precisa né? :)

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

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def event_log_params
    params.require(:event_log).permit(:date, :exit_time, :return_time, :requester, :phone, :descriptive_memorial, :measures_taken, :comments, :climate_conditions, :finished)
  end

end
