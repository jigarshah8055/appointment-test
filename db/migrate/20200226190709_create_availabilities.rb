class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.datetime :from
      t.datetime :to
      t.references :doctor, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
