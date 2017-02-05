app_path = ENV['RAILS_ROOT']

working_directory app_path

pid "#{app_path}/tmp/pids/unicorn.pid"

listen "0.0.0.0:3000"

stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

worker_processes 1

before_exec do |server|
	ENV['BUNDLE_GEMFILE'] = "#{app_path}/Gemfile"
end

# Speeds up your workers.
# See https://unicorn.bogomips.org/TUNING.html
preload_app true

# define how workers are spun up
# See https://unicorn.bogomips.org/Unicorn/Configurator.html
before_fork do |server, worker|
	# the following is hihgly recommended for Rails + "preload_app true"
	# as there's no need for the master process to hold a connection
	if defined?(Activerecord::Base)
		ActiveRecord::Base.connection.disconnect!
	end

	old_pid = "#{server.config[:pid]}.oldbin"

	# before forking, kill the master process that belongs to the .oldbin PID.
	# This enables 0 downtime deploys
	if File.exists?(old_pid) && server.pid != old_pid
		begin
			Process.kill("QUIT", File.read(old_pid).to_i)
		rescue Errno::ENOENT, Errno::ESRCH
			# someone else did our job for us
		end
	end
end

after_fork do |server, worker|
	if defined?(ActiveRecord::Base)
		ActiveRecord::Base.establish_connection
	end
end
