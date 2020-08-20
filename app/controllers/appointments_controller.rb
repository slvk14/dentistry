class AppointmentsController < ApplicationController
  before_action :set_appointment, except: %i[index create]

  def index
    render json: AppointmentBlueprint.render(Appointment.all, view: :complete)
  end

  def show
    render json: AppointmentBlueprint.render(@record, view: :complete)
  end

  def update
    if @record.update(permitted_params)
      render json: AppointmentBlueprint.render(@record, view: :complete)
    else
      render_custom_error("Unable to update record with id #{params[:id]}")
    end
  end

  def create
    if (record = Appointment.create(permitted_params))
      AppointmentConfirmationJob.perform_later(record.id)

      render json: AppointmentBlueprint.render(record, view: :complete)
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

  def set_appointment
    return if (@record = Appointment.find_by(id: params[:id]))

    raise_custom_error("Sorry, Appointment with id #{params[:id]} is not found")
  end

  def permitted_params
    params.permit(:client_id, :doctor_id, :procedure_id, :appointment_date)
  end
end
