# config valid only for current version of Capistrano
lock "3.8.1"

set :application, 'u-note'
set :repo_url, 'https://github.com/Nacchamu/u-note.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/home/local_user_home/.ssh/u-note.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

task :update do
  run_locally do
    application = fetch :application
    if test "[ -d #{application} ]"
      execute "cd #{application}; git pull"
    else
      execute "git clone #{fetch :repo_url} #{application}"
    end
  end
end


task :deploy => :archive do
  archive_path = fetch :archive_absolute_path
  archive_name = fetch :archive_name
  release_path = File.join(fetch(:deploy_to), fetch(:application))
  on roles(:web) do
    begin
      old_project_dir = File.join(release_path, capture("cd #{release_path}; ls -d */").chomp)
      if test "[ -d #{old_project_dir} ]"
        running_pid = capture("cd #{old_project_dir}; cat RUNNING_PID")
        execute "kill #{running_pid}"
      end
    rescue => e
      info "No previous release directory exists"
    end

    unless test "[ -d #{release_path} ]"
      execute "mkdir -p #{release_path}"
    end
    upload! archive_path, release_path
    execute "cd #{release_path}; tar -zxvf #{archive_name}"
    project_dir = File.join(release_path, capture("cd #{release_path}; ls -d */").chomp)
    launch = capture("cd #{project_dir}; ls bin/*").chomp
    execute "cd #{project_dir}; ( ( nohup #{launch} &>/dev/null ) & echo $! > RUNNING_PID)"
  end
end
