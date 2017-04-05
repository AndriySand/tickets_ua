#set :application, 'tickets_ua'
server '54.214.228.61', user: 'ubuntu', roles: %w{web}
set :deploy_to, "/home/sites/#{fetch(:application)}"

set :rails_env, 'production'
set :branch, 'master'
set :deploy_via, :copy
