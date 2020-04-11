teams = FactoryBot.create_list(:team_with_players, 2)
players = teams.map(&:players).flatten
statistics_types = FactoryBot.create_list(:statistics_type, 2)

matches = 3.times.map do
  teams.shuffle!
  FactoryBot.create(:match, home_team: teams.first, guest_team: teams.second)
end

matches.each do |match|
  players.each do |player|
    statistics_types.each do |statistics_type|
      FactoryBot.create(:statistic, match: match, player: player, statistics_type: statistics_type)
    end
  end
end
