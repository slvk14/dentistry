# frozen_string_literal: true

class DoctorBlueprint < ApplicationBlueprint
  identifier :id

  fields :first_name, :last_name, :email, :age, :type, :description

  view :with_appointments do
    association :appointments, blueprint: AppointmentBlueprint
  end
end
