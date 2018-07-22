class TypeOccurrencesController < ApplicationController

  def index
    @type_occurrences = OccurrenceType.order(:name).all
  end

  def new
    @type_occurrence = OccurrenceType.new
  end

  def create
    @type_occurrence = OccurrenceType.new(type_occurrence_params)

    if @type_occurrence.save
      redirect_to controller: "type_occurrences"
      flash[:success] = "Cadastrado com sucesso"
    else
      render :new
      flash[:danger] = "Opss! Algo deu errado!"
    end
  end

  def edit
    @type_occurrence = OccurrenceType.find(params[:id])
  end

  def update
    @type_occurrence = OccurrenceType.find(params[:id])

    if @type_occurrence.update(type_occurrence_params)
      redirect_to controller: "type_occurrences"
      flash[:success] = "Atualizado com sucesso"
    else
      render :edit
      flash[:danger] = "Opss! Algo deu errado"
    end

  end

  def destroy
    @type_occurrences = OccurrenceType.find(params[:id])
    @type_occurrences.destroy
    redirect_to controller: "type_occurrences"
    flash[:success] = "Excluído com sucesso"
  end

  private

  def type_occurrence_params
    #Deixar exatamente igual o model entre parenteses
    params.require(:occurrence_type).permit(:code, :name)
  end

end
