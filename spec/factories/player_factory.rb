FactoryBot.define do
  factory :player do
    name { Faker::Sports::Football.player }
    team
  end
end
