# frozen_string_literal: true

# spec/support/database_cleaner.rb
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    $redis.redis.flushall()
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
