require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'has a valid factory' do
    expect(build(:team)).to be_valid
  end

  let(:team) { create(:team) }

  describe 'ActiveModel validations' do
    it { expect(team).to validate_presence_of(:name) }
    it { expect(team).to validate_uniqueness_of(:name) }
  end

  describe 'ActiveRecord associations' do
    it { expect(team).to have_many(:home_matches).dependent(:destroy).with_foreign_key('home_team_id') }
    it { expect(team).to have_many(:guest_matches).dependent(:destroy).with_foreign_key('guest_team_id') }
    it { expect(team).to have_many(:players).dependent(:nullify) }
  end
end
