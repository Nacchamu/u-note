class Users::RegistrationsController < Devise::RegistrationsController

  def edit
    super
  end

  def update
    super
    @user = User.new(update_user_params)
    @user.save
  end

  private
  def update_user_params
    params.require(:user).permit(:name, :email, userinfos_attributes: [:avatar, :cover_img, :profiel, :hp_url])
  end

end