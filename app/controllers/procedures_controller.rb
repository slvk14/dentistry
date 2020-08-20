class ProceduresController < ApplicationController
  before_action :set_procedure, except: %i[index create]

  def index
    render json: ProcedureBlueprint.render(Procedure.all)
  end

  def show
    render json: ProcedureBlueprint.render(@record)
  end

  def update
    if @record.update(permitted_params)
      render json: ProcedureBlueprint.render(@record)
    else
      render_custom_error("Unable to update record with id #{params[:id]}")
    end
  end

  def create
    if (record = Procedure.create(permitted_params))
      render json: ProcedureBlueprint.render(record)
    else
      render_custom_error('Unable to create a record with such params')
    end
  end

  def destroy
    if @record.destroy
      render json: { '200' => 'Successfully destroyed' }
    else
      render_custom_error("Unable to destroy the record with id #{params[:id]}")
    end
  end

  private

  def set_procedure
    return if (@record = Procedure.find_by(id: params[:id]))

    raise_custom_error("Sorry, Procedure with id #{params[:id]} is not found")
  end

  def permitted_params
    params.permit(:name, :duration_min, :price_uah)
  end
end
