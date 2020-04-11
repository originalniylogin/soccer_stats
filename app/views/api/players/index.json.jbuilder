json.players @players do |player|
  json.call(player, :id, :name)

  json.team do
    json.call(player.team, :id, :name)
  end
end
