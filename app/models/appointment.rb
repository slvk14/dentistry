class Appointment < ApplicationRecord
  belongs_to :procedure, optional: true
  belongs_to :client, class_name: 'Client', optional: true
  belongs_to :doctor, class_name: 'Doctor', optional: true
end
