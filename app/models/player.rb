class Player < ApplicationRecord
  belongs_to :team
  has_many :statistics, dependent: :destroy
end
