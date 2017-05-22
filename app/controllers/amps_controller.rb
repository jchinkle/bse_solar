require 'csv'
require 'open-uri'

class AmpsController < ApplicationController
  def index
    data = ChargeData.new(CSV.new(open("http://10.193.31.254/log.csv"), headers: true))
    respond_to do |format|
      format.json { render json: data.to_hash }
      format.html { render }
    end
  end
end
