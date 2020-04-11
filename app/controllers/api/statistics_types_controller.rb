module Api
  class StatisticsTypesController < ApplicationController
    def index
      @statistics_types = StatisticsType.all
    end

    def rating
      @statistics_type = StatisticsType.find(params[:id])
      @rating = @statistics_type.rating(team_id: params[:team_id])
    end
  end
end
