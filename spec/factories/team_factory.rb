FactoryBot.define do
  factory :team do
    name { Faker::Sports::Football.unique.team }

    factory :team_with_players do
      transient do
        players_count { 5 }
      end

      after(:create) do |team, evaluator|
        create_list(:player, evaluator.players_count, team: team)
      end
    end
  end
end
