class MypagesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id).order("created_at DESC")
  end

  def show
  end

  def favorite
  end
end
