require 'rails_helper'

RSpec.describe Api::PlayersController, type: :controller do
  describe 'GET #index' do
    let!(:players) { create_list(:player, 5) }

    render_views

    it 'responses successfully' do
      get :index, as: :json

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8'

      expect(assigns(:players)).to eq(players)
    end
  end

  describe 'POST #set_statistic' do
    let!(:player) { create(:player) }
    let!(:match) { create(:match, home_team: player.team) }
    let!(:future_match) { create(:match, home_team: player.team, match_date: 2.month.from_now) }
    let!(:statistics_type) { create(:statistics_type) }

    it 'responses successfully' do
      post  :set_statistic,
            as: :json,
            params: { id: player.id },
            body: { statistic: {
              statistics_type_id: statistics_type.id,
              match_id: match.id,
              score: Faker::Number.decimal(l_digits: 2, r_digits: 2),
            } }.to_json

      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8'
    end

    it 'responses with error' do
      post  :set_statistic,
            as: :json,
            params: { id: player.id },
            body: { statistic: {
              statistics_type_id: statistics_type.id,
              match_id: future_match.id,
              score: Faker::Number.decimal(l_digits: 2, r_digits: 2),
            } }.to_json

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.headers['Content-Type']).to eq 'application/json; charset=utf-8'
    end
  end
end
