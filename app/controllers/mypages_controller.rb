class MypagesController < ApplicationController

  def favorite
    @favorites = Favorite.where(user_id: current_user.id).order("created_at DESC")
  end

  def show
  end

end
