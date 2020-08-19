class Procedure < ApplicationRecord
  has_one :appointment
  belongs_to :clients, optional: true
  belongs_to :doctors, optional: true
end
