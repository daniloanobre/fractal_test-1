# Set up a connection to Redis for manual caching
$redis = Redis::Namespace.new("fractal", redis: Redis.new)
