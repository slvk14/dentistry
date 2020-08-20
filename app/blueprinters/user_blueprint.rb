# frozen_string_literal: true

class UserBlueprint < ApplicationBlueprint
  identifier :id

  fields :first_name, :last_name, :email, :age, :type, :description

  view :with_appointments do
    association :appointment, blueprint: AppointmentBlueprint
  end
end
