# Proceeds with all the actions after appointment was created

class Appointments::Booking < ApplicationService
  def initialize(appointment_id)
    @record = Appointment.find_by(id: appointment_id)
  end

  def call
    send_confirmation_emails
    # TODO
    # Add more actions
  end

  def send_confirmation_emails
    UsersMailer.send_appointment_confirmation_emails(@record.doctor.email).deliver_later
    UsersMailer.send_appointment_confirmation_emails(@record.client.email).deliver_later
  end
end
