Fractal::Application.config.session_store :redis_store, servers: [ ENV["SESSION_STORE"] ]
