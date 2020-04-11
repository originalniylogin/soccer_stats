class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id', dependent: :destroy
  has_many :guest_matches, class_name: 'Match', foreign_key: 'guest_team_id', dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
