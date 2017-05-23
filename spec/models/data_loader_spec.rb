require 'rails_helper'

describe DataLoader do
  let(:loader) { described_class.new }

  before(:each) do
    allow_any_instance_of(described_class).
      to receive(:csv).and_return(CSV.new(open(load_fixture_path("log.csv"))))
    allow_any_instance_of(Pages::AdvancedDisplayPage).
      to receive(:get_html).and_return(open(load_fixture_path("ucm_a.htm")))
  end

  describe '#initialize' do
    it 'sets the charge data' do
      expect(loader.charge_data).to be_a(Hash)
    end

    it 'sets fetched_at to the current time' do
      Timecop.freeze do |datetime|
        expect(loader.fetched_at.to_i).to eq(datetime.to_i)
      end
    end

    it 'sets the meta data' do
      expect(loader.metadata.hours_in_log_period).to eq(1.0)
      expect(loader.metadata.records_available).to eq(1)
    end
  end

  describe '#new_records' do
    it 'returns an array' do
      expect(loader.new_records).to be_a(Array)
    end

  end
end
