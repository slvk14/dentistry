# frozen_string_literal: true

class AppointmentBlueprint < ApplicationBlueprint
  identifier :id

  fields :appointment_date

  view :complete do
    association :client, ClientBlueprint
    association :doctor, DoctorBluePrint
    association :procedure, ProcedureBlueprint
  end
end
