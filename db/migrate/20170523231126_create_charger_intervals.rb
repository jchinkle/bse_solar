class CreateChargerIntervals < ActiveRecord::Migration[5.1]
  def change
    create_table :charger_intervals do |t|
      t.integer :time_interval_id
      t.float :max_pv_volts
      t.float :max_charge_amps
      t.float :charge_amp_hours

      t.timestamps
    end

    add_foreign_key :time_intervals, :charger_intervals
  end
end
