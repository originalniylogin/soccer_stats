require 'rails_helper'

RSpec.describe StatisticsType, type: :model do
  it 'has a valid factory' do
    expect(build(:statistics_type)).to be_valid
  end

  let (:statistics_type) { create(:statistics_type) }

  describe 'ActiveModel validations' do
    it { expect(statistics_type).to validate_presence_of(:name) }
    it { expect(statistics_type).to validate_uniqueness_of(:name) }
  end

  describe 'ActiveRecord associations' do
    it { expect(statistics_type).to have_many(:statistics).dependent(:destroy) }
  end
end
