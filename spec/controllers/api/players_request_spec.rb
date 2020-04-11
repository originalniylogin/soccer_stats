require 'rails_helper'

RSpec.describe Api::PlayersController, type: :controller do
  describe "GET #index" do
    let!(:players) { create_list(:player, 5) }

    render_views

    it "reads like a sentence (almost)" do
      get :index, as: :json

      expect(response).to have_http_status(:success) # 200
      expect(response).to render_template(:index)
      expect(response.headers["Content-Type"]).to eq "application/json; charset=utf-8"

      expect(assigns(:players)).to eq(players)
    end
  end
end
