require 'rails_helper'

describe AdvancedDisplayPage do
  let(:display) { described_class.new("test.url") }

  before(:each) do
    allow_any_instance_of(described_class).
      to receive(:get_html).and_return(open(load_fixture_path("ucm_a.htm")))
  end
  
  describe '#hours_in_log_period' do
    it 'returns 1.0, the value in the field' do
      expect(display.hours_in_log_period).to eq(1.0)
    end
  end

  describe '#records_available' do
    it 'returns the number of records available in the csv file' do
      expect(display.records_available).to eq(1)
    end
  end
end

