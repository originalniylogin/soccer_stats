module Api
  class TeamsController < ApplicationController
    def index
      @teams = Team.all.includes(:players)
    end
  end
end
