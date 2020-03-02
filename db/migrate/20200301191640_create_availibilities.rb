class CreateAvailibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availibilities do |t|
      t.datetime :day_date
      t.datetime :end_time
      t.datetime :start_time
      t.integer :status
      t.references :doctor, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
