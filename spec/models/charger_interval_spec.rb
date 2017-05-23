require 'rails_helper'

describe ChargerInterval do
  describe 'Relationships' do
    it { is_expected.to belong_to(:time_interval) }
  end
end
