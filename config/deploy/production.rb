# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '54.92.37.203', user: 'ec2-user', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/u-note.pem'
