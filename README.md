# README

# notable_health_challenge

App was built with Ruby on Rails 

# How to start up app

- Clone repo from git

Ensure you are at the root level of the project before running the following commands. 

- Run "bundle install"
- Run "db:migrate"
- Run "db:seed"
- Run "rails s"

Enjoy! You will be presented with all the doctor's and appointment information in JSON format. 

# Endpoints:

- GET "/" will render all the doctors with his or her appointments 
- GET "/1" will render a specific doctor with all of his or her appointments. Requires the following params: id
- GET "/appointments/030220222-153919" will render all appointments matching the specific date and time 
- POST "delete_appointment" will remove an appointment when provided the correct details. Requires the following params: doctorID, patientFirstName, patientLastName, appointmentDateTime
- POST "add_appointment" will add an appointment if it is available. Requires the following params: doctorID, patientFirstName, patientLastName, appointmentDateTime, appointmentKind