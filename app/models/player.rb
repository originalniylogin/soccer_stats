class Player < ApplicationRecord
  belongs_to :team
  has_many :statistics, dependent: :destroy

  validates :name, presence: true

  def set_statistic(statistic_params)
    presented = statistics.find_by(
      statistics_type_id: statistic_params[:statistics_type_id],
      match_id: statistic_params[:match_id]
    )

    if presented
      presented.update(score: statistic_params[:score])
      presented
    else
      Statistic.create(statistic_params.merge(player_id: id))
    end
  end

  def check_statistic(statistic_params)
    last_matches = Match.by_team(team.id).past.by_date.limit(5)
    last_statistics = statistics.by_match_and_type(
      last_matches.map(&:id),
      statistic_params[:statistics_type_id]
    )

    last_statistics.succeed(statistic_params[:score])
  end
end
