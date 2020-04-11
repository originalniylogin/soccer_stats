require 'rails_helper'

RSpec.describe Match, type: :model do
  it 'has a valid factory' do
    expect(build(:match)).to be_valid
  end

  let (:match) { create(:match) }

  describe 'ActiveModel validations' do
    it { expect(match).to validate_presence_of(:match_date) }
  end

  describe 'ActiveRecord associations' do
    it { expect(match).to belong_to(:home_team) }
    it { expect(match).to belong_to(:guest_team) }
    it { expect(match).to have_many(:statistics).dependent(:destroy) }
  end
end
