workers ENV.fetch("WEB_CONCURRENCY", 2).to_i

threads_count = ENV.fetch("RAILS_MAX_THREADS", 5).to_i
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT", 3000)

# Specifies the `environment` Puma will run in.
environment ENV.fetch("RAILS_ENV", "development")

preload_app!

# Allow Puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart

# Run the Solid Queue supervisor inside of Puma for single-server deployments
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Specify the PID file.
pidfile ENV.fetch("PIDFILE", "tmp/pids/server.pid")

# Use a control app for managing Puma (optional but useful for debugging).
# activate_control_app

on_worker_boot do
  # Reconnect to the database for each worker (important in clustered mode).
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
