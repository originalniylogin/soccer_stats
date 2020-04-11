require 'rails_helper'

RSpec.describe Api::TeamsController, type: :controller do
  describe "GET #index" do
    let!(:teams) { create_list(:team_with_players, 2) }

    render_views

    it "reads like a sentence (almost)" do
      get :index, as: :json

      expect(response).to have_http_status(:success) # 200
      expect(response).to render_template(:index)
      expect(response.headers["Content-Type"]).to eq "application/json; charset=utf-8"

      expect(assigns(:teams)).to eq(teams)
    end
  end
end
