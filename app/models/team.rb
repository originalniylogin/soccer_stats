class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :home_mathces, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :guest_mathces, class_name: 'Match', foreign_key: 'guest_team_id'
end
