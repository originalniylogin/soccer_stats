module Api
  class PlayersController < ApplicationController
    def index
      @players = Player.all.includes(:team)
    end

    def set_statistic
      @player = Player.find(params[:id])
      @statistic = player.set_statistic(statistic_params)

      if @statistic.valid?
        render json: { message: 'Success' }, status: :ok
      else
        render json: { message: 'Validation failed', errors: @statistic.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def check_statistic
      @player = Player.find(params[:id])
      @statistics = @player.check_statistic(statistic_params).includes({ player: :team }, :match, :statistics_type)

      render json: { message: 'Player has not succeed' }, status: :ok unless @statistics.present?
    end

    private

    def statistic_params
      params.require(:statistic).permit(:statistics_type_id, :match_id, :score)
    end
  end
end
