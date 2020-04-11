module Api
  class StatisticsTypesController < ApplicationController
    def index
      @statistics_types = StatisticsType.all
    end
  end
end
