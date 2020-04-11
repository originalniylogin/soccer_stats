FactoryBot.define do
  factory :match do
    match_date do
      Faker::Time.between_dates(from: 1.month.ago, to: 2.days.ago, period: :evening)
    end

    association :home_team, factory: :team
    association :guest_team, factory: :team
  end
end
