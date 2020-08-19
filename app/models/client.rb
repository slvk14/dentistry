class Client < User
  has_many :appointments, foreign_key: :client_id
  has_many :doctors, through: :appointments, foreign_key: :doctor_id
  has_many :procedures, through: :appointments
end
