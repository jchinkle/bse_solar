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

  def new_records
    charge_data.map do |time_interval|

    end
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
