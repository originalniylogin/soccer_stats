module Api
  class PlayersController < ApplicationController
    def index
      @players = Player.all.includes(:team)
    end
  end
end
