json.rating do
  json.call(@statistics_type, :id, :name)

  json.players @rating do |player|
    json.call(player, :id, :name, :average_score)
  end
end
