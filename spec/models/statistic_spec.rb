require 'rails_helper'

RSpec.describe Statistic, type: :model do
  it 'has a valid factory' do
    expect(build(:statistic)).to be_valid
  end

  let(:statistic) { create(:statistic) }

  describe 'ActiveModel validations' do
    it 'Cannot be associated with future matches' do
      future_match = create(:match, match_date: 1.month.from_now)
      future_statistic = build(:statistic, match: future_match)

      expect(future_statistic).not_to be_valid
    end
  end

  describe 'ActiveRecord associations' do
    it { expect(statistic).to belong_to(:match) }
    it { expect(statistic).to belong_to(:player) }
    it { expect(statistic).to belong_to(:statistics_type) }
  end
end
