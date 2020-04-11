require 'rails_helper'

RSpec.describe Player, type: :model do
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
    context 'set_statistic' do
      let(:match) { create(:match, home_team: player.team) }
      let(:statistics_type) { create(:statistics_type) }

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

    context 'check_statistic' do
      let(:player) { create(:player) }
      let(:match) { create(:match, home_team: player.team) }
      let(:statistics) { create_list(:statistic, 3, player: player, match: match, score: Faker::Number.between(from: 10, to: 20)) }

      it 'checks if player succeed' do
        player_results = player.check_statistic(
          statistics_type_id: statistics.first.statistics_type_id,
          score: 9,
        )

        expect(player_results.size).to eq(1)

        player_results = player.check_statistic(
          statistics_type_id: statistics.first.statistics_type_id,
          score: 21,
        )

        expect(player_results.size).to eq(0)
      end
    end
  end
end
