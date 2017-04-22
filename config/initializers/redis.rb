$redis = Redis::Namespace.new("fractal", redis: Redis.new)
Rails.application.config.cache_store = :redis_store, ENV["cache_store"], { expires_in: 90.minutes }
Fractal::Application.config.session_store :redis_store, servers: [ ENV["session_store"] ]
