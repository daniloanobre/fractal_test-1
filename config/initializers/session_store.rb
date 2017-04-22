Fractal::Application.config.session_store :redis_store, servers: 
  [ Rails.application.secrets.redis_session_store ]
