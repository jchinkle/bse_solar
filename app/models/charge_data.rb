class ChargeData
  attr_accessor :csv

  def initialize(csv)
    @csv = csv
  end

  def to_hash
    output = {}
    @csv.each do |line|
      output[line[0].to_i] = {
        time_period: line[9].to_f,
        max_total_charge_amps: line[8].to_f,
        battery_volts: {
          max: line[1].to_f,
          min: line[2].to_f },
        charge_time: {
          accept: line[3].to_f,
          float: line[4].to_f},
        discharge: {
          max_amps: line[5].to_f,
          max_amp_hours: line[6].to_f,
          min_amp_hours: line[7].to_f},
        chargers: [
          { max_pv_volts: line[10].to_f,
            max_charge_amps: line[11].to_f,
            charge_amp_hours: line[12].to_f },
          { max_pv_volts: line[13].to_f,
            max_charge_amps: line[14].to_f,
            charge_amp_hours: line[15].to_f }
        ]
      }
    end
    output
  end
end
