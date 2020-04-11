class StatisticsType < ApplicationRecord
  has_many :statistics, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def rating(team_id: false)
    players = team_id ? Player.where(team_id: team_id) : Player.all

    players.joins(:statistics).
      select('players.*, avg(score) AS average_score').
      where(statistics: { statistics_type_id: id }).
      group(:id).
      order('avg(score) desc').
      limit(5)
  end
end
