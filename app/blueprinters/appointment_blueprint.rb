# frozen_string_literal: true

class AppointmentBlueprint < ApplicationBlueprint
  identifier :id

  fields :appointment_date

  view :complete do
    association :client, blueprint: ClientBlueprint
    association :doctor, blueprint: DoctorBlueprint
    association :procedure, blueprint: ProcedureBlueprint
  end
end
