class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :guest_team, class_name: 'Team'
  has_many :statistics, dependent: :destroy

  validates :match_date, presence: true
  # TODO: guest and home teams are different

  scope :by_team, ->(team_id) { where('home_team_id = :team_id OR guest_team_id = :team_id', team_id: team_id) }
  scope :past, -> { where('match_date < ?', DateTime.now) }
  scope :by_date, -> { order(match_date: :desc) }
end
