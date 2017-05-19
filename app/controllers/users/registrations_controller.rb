class Users::RegistrationsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    user = User.update(update_params)
    redirect_to action: "edit"
  end

  private
  def update_params
    params.require(:user).permit(:name, :email, :avatar, :cover_img, :profiel, :hp_url).merge(id: current_user.id)
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
