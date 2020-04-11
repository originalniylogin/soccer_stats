FactoryBot.define do
  factory :statistic do
    score { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    player
    match
    statistics_type
  end
end
