class UsersController < ApplicationController
  def following
    @followings = Relationship.where(follower_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def followers
    @followers = Relationship.where(followed_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def following_article
    users = []
    params[:followed_users].each do |i, user|
      users << user[:id].to_i
    end
    followings = Relationship.where(follower_id: current_user.id)
    @articles = Article.where(user_id: users).order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end
end
