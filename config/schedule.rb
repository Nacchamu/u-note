require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, 'log/cron.log'
set :environment, :development

every :monday, :at => '12pm' do
  rake "mail:mail_delivery"
end
