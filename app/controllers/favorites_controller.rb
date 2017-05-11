class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.where(user_id: current_user.id, article_id: params[:note_id]).first_or_initialize
    @favorite.save
  end

  def update
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
  end

  private

end
