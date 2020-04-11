class Statistic < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :statistics_type
end
