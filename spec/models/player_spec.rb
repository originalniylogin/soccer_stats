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

  describe 'public instance methods' do
    let(:match) { create(:match, home_team: player.team) }
    let(:statistics_type) { create(:statistics_type) }

    context 'set_statistic' do
      it 'creates or updates allready existed statistic' do
        2.times do
          statistic = player.set_statistic({
            match_id: match.id,
            statistics_type_id: statistics_type.id,
            score: Faker::Number.decimal(l_digits: 2, r_digits: 2),
          })

          expect(statistic).to be_valid
        end
      end

      it 'fails if match isnt happen yet' do
        match.update(match_date: 2.month.from_now)

        statistic = player.set_statistic({
          match_id: match.id,
          statistics_type_id: statistics_type.id,
          score: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        })

        expect(statistic).not_to be_valid
      end
    end
  end
end
