# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    appointment_date { DateTime.now }

    client
    doctor
    procedure
  end
end
