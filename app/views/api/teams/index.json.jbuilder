json.teams @teams do |team|
  json.call(team, :id, :name)

  json.players team.players do |player|
    json.call(player, :id, :name)
  end
end
