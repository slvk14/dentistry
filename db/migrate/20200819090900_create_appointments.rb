class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :client
      t.belongs_to :doctor
      t.belongs_to :procedure
      t.datetime :appointment_date
    end
  end
end
