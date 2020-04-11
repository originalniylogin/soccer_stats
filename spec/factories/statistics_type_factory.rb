FactoryBot.define do
  factory :statistics_type do
    name { Faker::Movies::Lebowski.unique.character }
    description { Faker::Movies::Lebowski.quote }
  end
end
