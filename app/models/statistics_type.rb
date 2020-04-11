class StatisticsType < ApplicationRecord
  has_many :statistics, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
