class MypagesController < ApplicationController

  def favorite
    @favorites = Favorite.where(user_id: current_user.id).order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id).order("created_at DESC")
  end

end
