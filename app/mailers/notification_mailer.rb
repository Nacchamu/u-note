class NotificationMailer < ApplicationMailer
  def notification(user)
    @user = user
    @line = "--------------------------------------------------------------------------------------------------------------------------"
    users = []
    followings = Relationship.where(follower_id: user.id)
    followings.each do |following|
      users << following.followed.id
    end
    to = Time.now.at_beginning_of_day
    from = (to - 8.day).at_end_of_day
    @articles = Article.where(user_id: users).where(created_at: from...to)
    mail to: user.email
  end
end
