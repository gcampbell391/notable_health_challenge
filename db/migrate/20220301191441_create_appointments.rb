class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :patient_first_name
      t.string :patient_last_name
      t.string :appointment_date_time
      t.string :appointment_kind
      t.belongs_to :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
