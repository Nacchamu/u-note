class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]

  def new
    build_resource({})
    yield resource if block_given?
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        redirect_to after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        redirect_to after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render :new
    end
  end

  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

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
