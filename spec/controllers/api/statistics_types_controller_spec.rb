require 'rails_helper'

RSpec.describe Api::StatisticsTypesController, type: :controller do
  describe "GET #index" do
    let!(:statistics_types) { create_list(:statistics_type, 2) }

    render_views

    it "responses succesfully" do
      get :index, as: :json

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.headers["Content-Type"]).to eq "application/json; charset=utf-8"

      expect(assigns(:statistics_types)).to eq(statistics_types)
    end
  end

  describe 'GET #rating' do
    let!(:statistics_type) { create(:statistics_type) }
    let!(:team) { create(:team_with_players) }

    render_views

    it 'responses successfully' do
      team.players.each do |player|
        create_list(:statistic, 3, player: player, statistics_type: statistics_type, match: create(:match, home_team: team))
      end

      get :rating,
          as: :json,
          params: { id: statistics_type.id, team_id: team.id }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:rating)
      expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8'
    end
  end
end
