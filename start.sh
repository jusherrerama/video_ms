docker-compose build --no-cache
docker-compose run --rm videos_ms rails db:create
docker-compose run --rm videos_ms rails db:migrate
docker-compose up
