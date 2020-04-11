class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :guest_team, class_name: 'Team'
  has_many :statistics, dependent: :destroy

  validates :match_date, presence: true
  # TODO: guest and home teams are different
end
