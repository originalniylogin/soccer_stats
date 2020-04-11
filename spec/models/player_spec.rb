require 'rails_helper'

RSpec.describe Player, type: :model do
  before(:each) do
    Faker::UniqueGenerator.clear
  end

  it 'has a valid factory' do
    expect(build(:player)).to be_valid
  end

  let(:player) { create(:player) }

  describe 'ActiveModel validations' do
    it { expect(player).to validate_presence_of(:name) }
  end

  describe 'ActiveRecord associations' do
    it { expect(player).to belong_to(:team) }
    it { expect(player).to have_many(:statistics).dependent(:destroy) }
  end
end
