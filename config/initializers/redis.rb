# frozen_string_literal: true

# Set up a connection to Redis for manual caching
$redis = Redis::Namespace.new("directional_boring", redis: Redis.new(port: ENV["REDIS_PORT"]))
