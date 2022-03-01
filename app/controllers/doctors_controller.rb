class DoctorsController < ActionController::Base
    protect_from_forgery with: :null_session

    # Renders all doctors with all of their appointments
    def index
        doctors = Doctor.all
        render json: doctors, include: [:appointments]
    end

    # Renders single doctor with his or her appointments by supplying ID
    def show
        doctor = Doctor.find(params[:id])
        if doctor
            render json: {doctor: doctor}, include: [:appointments]
        else
            render json: { error: "Not found!" }, status: 404
        end 
    end

    # Renders all appointments 
    def all_appointments
        appointments = Appointment.all
        render json: appointments 
    end 

    def show_appointments_for_specific_day
        puts 'appointments for day'
        
        appointments = Appointment.select {|appointment| appointment.appointment_date_time == params[:date]}
        if appointments 
            render json: {appointments: appointments}
        else 
            render json: { error: "Not found!" }, status: 404
        end
    end 

    # Removes an appointment for a patient
    def delete_appointment 
        puts "delete appointment"
        @appointment = Appointment.find_by(doctor_id: params[:doctorID], patient_first_name: params[:patientFirstName], patient_last_name: params[:patientLastName], appointment_date_time: params[:appointmentDateTime])
        if @appointment == nil 
            render json: {status: "Something went wrong. Please try again and ensure appointment details are correct."}
        else 
            render json: {appointment: @appointment}
            @appointment.destroy
        end
    end 

    # Adds an appointment for a patient
    def add_appointment
        puts 'adding appointment'
        @appointment = Appointment.find_by(doctor_id: params[:doctorID], patient_first_name: params[:patientFirstName], patient_last_name: params[:patientLastName], appointment_date_time: params[:appointmentDateTime])
        if @appointment != nil 
            return render json: {error: "Appointment already exists or time slot is already full. Please try again."}
        else 
            # TODO: Add logic to validate time/date information is correct. 
            @appointment = Appointment.create(doctor_id: params[:doctorID], patient_first_name: params[:patientFirstName], patient_last_name: params[:patientLastName], appointment_date_time: params[:appointmentDateTime], appointment_kind: params[:appointmentKind])
            render json: {appointment: @appointment}
        end 

    end 

end
