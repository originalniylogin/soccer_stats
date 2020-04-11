class Statistic < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :statistics_type

  validate :future_matches

  private

  def future_matches
    if match.present? && match.match_date > DateTime.now
      errors.add(:match, 'Cannot be associated with future matches.')
    end
  end
end
