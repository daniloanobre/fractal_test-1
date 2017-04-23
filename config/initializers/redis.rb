$redis = Redis::Namespace.new("fractal", redis: Redis.new)
Rails.application.config.cache_store = :redis_store, ENV["CACHE_STORE"], { expires_in: 90.minutes }
Fractal::Application.config.session_store :redis_store, servers: [ ENV["SESSION_STORE"] ]
