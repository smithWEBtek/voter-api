# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "voter-api"
set :repo_url, "git@github.com:smithWEBtek/voter-api.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/voter-api"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/master.key", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# namespace :deploy do
#     desc 'Remove old releases with sudo'
#     task :cleanup_with_sudo do
#       on roles(:all) do
#         within releases_path do
#           execute :sudo, :rm, '-rf', releases[0..-6].join(' ')
#         end
#       end
#     end
#   end

#   after 'deploy:finishing', 'deploy:cleanup_with_sudo'

namespace :deploy do
    desc 'Remove old releases with sudo'
    task :cleanup_with_sudo do
      on roles(:all) do
        within releases_path do
          # Fetch the list of releases
          releases = capture(:ls, '-xtr', releases_path).split
          if releases.count >= fetch(:keep_releases)
            # Remove the oldest releases, keeping the most recent ones
            directories_to_remove = (releases - releases.last(fetch(:keep_releases)))
            if directories_to_remove.any?
              execute :sudo, :rm, '-rf', directories_to_remove.map { |release| File.join(releases_path, release) }.join(' ')
            end
          end
        end
      end
    end
  end
  
  after 'deploy:finishing', 'deploy:cleanup_with_sudo'
