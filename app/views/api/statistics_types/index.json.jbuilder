json.statistics_types @statistics_types do |statistics_type|
  json.call(statistics_type, :id, :name, :description)
end
