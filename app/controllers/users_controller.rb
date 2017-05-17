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
    @followings = Relationship.where(follower_id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
