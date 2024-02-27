# Connect to the Redis server using environment variables
Resque.redis = Redis.new(
  host:     ENV["REDIS_HOST"],
  port:     ENV["REDIS_PORT"],  # Corrected: Use REDIS_PORT for port
  password: ENV["REDIS_PASSWORD"]
)

# Set the Redis namespace if provided in the environment
if ENV["RESQUE_NAMESPACE"].present?
  Resque.redis.namespace = ENV["RESQUE_NAMESPACE"].to_sym
end

# Optional: Enable thread-safety (if needed)
# Resque.redis.client.reconnect  # If thread-safety is required

# Additional notes:
# - Ensure the environment variables `REDIS_HOST`, `REDIS_PORT`, and `REDIS_PASSWORD`
#   are set correctly on your server.
# - If your Redis connection is not persistent or there's a need for frequent disconnects
#   and reconnects, consider adding `Resque.redis.client.reconnect` after the
#   `Resque.redis = Redis.new` line. However, use this option cautiously as it might
#   introduce some overhead.
