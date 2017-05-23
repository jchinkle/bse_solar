require 'rails_helper'

describe TimeInterval do
  describe 'Relationships' do
    it { is_expected.to have_many(:charger_intervals) }
  end
end
