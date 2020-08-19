# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

doctor = Doctor.create({ first_name: 'First1', last_name: 'Last1', age: 47, type: 'Doctor', description: 'Very good doctor', email: 'doctor@email.com', password: 'doctor123'})
client = Client.create({ first_name: 'First1CL', last_name: 'Last1CL', age: 17, type: 'Client', description: 'Normal Client', email: 'client@email.com', password: 'client123'})
procedure = Procedure.create({name: 'StomachAche help', duration_min: 15, price_uah: 200})
appointment = Appointment.create({client_id: client.id, doctor_id: doctor.id, procedure_id: procedure.id, appointment_date: "2014-05-20T00:00:00"})
