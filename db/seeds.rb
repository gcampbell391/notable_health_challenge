# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying old seed data..."
Appointment.destroy_all
Doctor.destroy_all


puts "Creating doctors..."

doctor1 = Doctor.create(first_name: "Brian", last_name: "Nguyen")
doctor2 = Doctor.create(first_name: "Alec", last_name: "Rau")
doctor3 = Doctor.create(first_name: "Janise", last_name: "Qin")

puts "Doctors created!"

puts "Creating appointments..."

Appointment.create(doctor_id: doctor1.id, patient_first_name: "Gene", patient_last_name: "Campbell", appointment_date_time: "030120222-153919", appointment_kind: "New Patient")
Appointment.create(doctor_id: doctor1.id, patient_first_name: "Bill", patient_last_name: "Simpson", appointment_date_time: "030120222-153919", appointment_kind: "Follow-up")
Appointment.create(doctor_id: doctor1.id, patient_first_name: "Amy", patient_last_name: "Chapman", appointment_date_time: "030120222-153919", appointment_kind: "New Patient")
Appointment.create(doctor_id: doctor2.id, patient_first_name: "Greg", patient_last_name: "Anderson", appointment_date_time: "030220222-153919", appointment_kind: "Follow-up")
Appointment.create(doctor_id: doctor2.id, patient_first_name: "Maria", patient_last_name: "Wilson", appointment_date_time: "030220222-153919", appointment_kind: "Follow-up")
Appointment.create(doctor_id: doctor3.id, patient_first_name: "Larry", patient_last_name: "Smith", appointment_date_time: "030220222-153919", appointment_kind: "New Patient")

puts "Appointments created!" "030120222-153919"