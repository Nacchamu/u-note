class RelationshipsController < ApplicationController

  def create
    Relationship.create(follower_id: current_user.id, followed_id: params[:followed_id])
    redirect_to :back
  end

  def destroy
    unfollow = Relationship.find(params[:id])
    unfollow.destroy
    redirect_to :back
  end
end
