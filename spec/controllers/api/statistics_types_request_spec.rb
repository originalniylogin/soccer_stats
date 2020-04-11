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
end
