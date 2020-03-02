class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: { to_table: 'users' }
      t.references :patient, foreign_key: { to_table: 'users' }
      t.datetime :date
      t.timestamps
    end
  end
end
