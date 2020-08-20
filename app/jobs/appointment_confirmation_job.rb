# frozen_string_literal: true

class AppointmentConfirmationJob < ApplicationJob
  def perform(appointment_id)
    Appointments::Booking.call(appointment_id)
  end
end
