#refer https://www.digitalocean.com/community/tutorials/how-to-deploy-rails-apps-using-unicorn-and-nginx-on-centos-6-5
#https://devcenter.heroku.com/articles/rails-unicorn
# Set the working application directory
# working_directory "/path/to/your/app"
app_name='lesson4am'
working_directory "/www/#{app_name}"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "#{working_directory}/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "#{working_directory}/log/unicorn_err.log"
stdout_path "#{working_directory}/log/unicorn_std.log"

# Unicorn socket
socket_file = "/tmp/unicorn.#{app_name}.sock"
print "socket_file: #{socket_file}"
listen socket_file, backlog: 1024
listen 8080, tcp_nopush: false

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 5)
timeout 300
preload_app true

before_fork do |server, worker|
    Signal.trap 'TERM' do
        puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
        Process.kill 'QUIT', Process.pid
    end

    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
    Signal.trap 'TERM' do
        puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
    end

    defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
end

