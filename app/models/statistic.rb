class Statistic < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :statistics_type

  validate :future_matches
  # TODO: validate that player actually plays for the team

  scope :succeed, ->(score) { where('score > ?', score) }

  scope :by_match_and_type, ->(match_id, statistics_type_id) do
    where(match_id: match_id, statistics_type_id: statistics_type_id)
  end

  private

  def future_matches
    if match.present? && match.match_date > DateTime.now
      errors.add(:match, 'Future matches cannot have statistics.')
    end
  end
end
