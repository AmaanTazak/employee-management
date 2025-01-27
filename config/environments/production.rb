require "active_support/core_ext/integer/time"

Rails.application.configure do

config.eager_load = true
config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
config.assets.compile = false
config.log_level = :debug
config.log_tags = [:request_id]
config.action_mailer.perform_caching = false
config.i18n.fallbacks = true
config.active_support.deprecation = :notify
config.log_formatter = ::Logger::Formatter.new
config.active_record.dump_schema_after_migration = false

  
end
