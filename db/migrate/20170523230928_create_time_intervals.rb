class CreateTimeIntervals < ActiveRecord::Migration[5.1]
  def change
    create_table :time_intervals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.float :time_period
      t.float :max_total_charge_amps
      t.float :battery_volts_max
      t.float :battery_volts_min
      t.float :accept_charge_time
      t.float :float_charge_time

      t.timestamps
    end
  end
end
