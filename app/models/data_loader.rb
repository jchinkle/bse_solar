require 'csv'
require 'open-uri'

class DataLoader
  attr_accessor :charge_data, :fetched_at, :metadata

  delegate :hours_in_log_period, :records_available, to: :metadata

  def initialize
    @charge_data = ChargeData.new(csv).to_hash
    @fetched_at = DateTime.now
    @metadata = Pages::AdvancedDisplayPage.new(base_url)
  end

  def save
    charge_data.each do |time, interval|
      time_interval = TimeInterval.create(
        start_date: fetched_at,
        end_date: nil, 
        time_period: interval[:time_period],
        max_total_charge_amps: interval[:max_totel_charge_amps],
        battery_volts_max: interval[:battery_volts][:max],
        battery_volts_min: interval[:battery_volts][:min],
        accept_charge_time: interval[:charge_time][:accept],
        float_charge_time: interval[:charge_time][:float]
      )

      interval[:chargers].each do |charger|
        time_interval.charger_intervals.create(
          max_pv_volts: charger[:max_pv_volts],
          max_charge_amps: charger[:max_charge_amps],
          charge_amp_hours: charger[:charge_amp_hours]
        )
      end
    end
  end

  def data_to_time(intervals_ago, interval)
    time_period = interval[:time_period]
    hours_in_period = metadata.hours_in_log_period
  end

  private

  def csv
    CSV.new(open("#{base_url}/log.csv"), headers: true)
  end

  def base_url
    #TODO: Move the IP to an env variable...
   "http://10.193.31.254"
  end
end
