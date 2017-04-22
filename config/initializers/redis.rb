$redis = Redis::Namespace.new("fractal", redis: Redis.new)
Rails.application.config.cache_store = :redis_store, 
  Rails.application.secrets.redis_cache_store, { expires_in: 90.minutes }
