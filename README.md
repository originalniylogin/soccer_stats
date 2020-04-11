# Стэк технологий

* ruby 2.7.1
* RubyOnRails 6.0.2
* Postgresql 11.7

# Запуск приложения

```
bundle install
rails db:create db:migrate db:seed
rails s
```

В переменных окружения необходимо указать данные для авторизации в Postgres. В проекте для этого используется гем `dotenv`.

# Использование

В проекте реализованно несколько api-эндпоинтов для демонстрации созданных методов:

```
# Отображает список комманд
get: /api/teams

# Отображает список игроков
get: /api/players

# Отображает типы показателей
get: /api/statistics_types

# Позволяет отметить, что игрок выполнил показатель в матче
post: /api/players/:id/set_statistic 

# Проверяет, выполнил ли игрок конкретный показатель хотя бы раз
# за последние 5 матчей
get: /api/players/:id/check_statistic?statistics_type=&score=

# Отображает топ-5 игроков по конкретному показателю в конкретной
# команде и по всем командам в целом
get: /api/statistics_types/:id/rating?team_id=
```
