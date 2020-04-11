json.player @player.name
json.team @player.team.name
json.statistics_type @statistics.first.statistics_type.name

json.statistics @statistics do |statistic|
  json.match_date statistic.match.match_date
  json.score statistic.score
end
