namespace :mail do
  desc "asynchronous mailing process"

  task mail_delivery: :environment do
    User.all.each do |user|
      NotificationMailer.notification(user).deliver_now
    end
  end

end
