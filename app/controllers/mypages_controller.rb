class MypagesController < ApplicationController

  def favorite
    @favorites = Favorite.includes(:article, :user).where(user_id: current_user.id).order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id).order("created_at DESC")
    @confirm = Relationship.where(follower_id: current_user.id).where(followed_id: params[:id]) if user_signed_in?
    @followings = Relationship.where(follower_id: current_user.id) if user_signed_in?
    @followers = Relationship.where(followed_id: current_user.id) if user_signed_in?
  end

end
