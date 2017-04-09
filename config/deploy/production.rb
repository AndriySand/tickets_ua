#set :application, 'tickets_ua'
server '54.218.130.25', user: 'ubuntu', roles: %w{web, app}
set :deploy_to, "/home/sites/#{fetch(:application)}"

set :rails_env, 'production'
set :branch, 'master'
set :deploy_via, :copy
