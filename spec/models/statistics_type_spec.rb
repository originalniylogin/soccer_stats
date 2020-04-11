require 'rails_helper'

RSpec.describe StatisticsType, type: :model do
  it 'has a valid factory' do
    expect(build(:statistics_type)).to be_valid
  end

  let(:statistics_type) { create(:statistics_type) }

  describe 'ActiveModel validations' do
    it { expect(statistics_type).to validate_presence_of(:name) }
    it { expect(statistics_type).to validate_uniqueness_of(:name) }
  end

  describe 'ActiveRecord associations' do
    it { expect(statistics_type).to have_many(:statistics).dependent(:destroy) }
  end

  describe 'public instance methods' do
    context 'rating' do
      let(:statistics_type) { create(:statistics_type) }
      let(:teams) { create_list(:team, 2) }
      let(:team) { create_list(:player, 5, team: teams.first) }
      let(:other_team) { create_list(:player, 5, team: teams.second) }

      it 'shows players top-five' do
        team.each do |player|
          create_list(:statistic, 3, player: player, statistics_type: statistics_type, match: create(:match, home_team: teams.first, guest_team: teams.second))
        end

        other_team.each do |player|
          create_list(:statistic, 3, player: player, statistics_type: statistics_type, match: create(:match, home_team: teams.second, guest_team: teams.first))
        end

        rating = statistics_type.rating(team_id: teams.first.id)
        expect(rating.first.average_score).to be >= rating.last.average_score
        expect(rating.map(&:team_id).uniq).to eq([teams.first.id])
      end
    end
  end
end
