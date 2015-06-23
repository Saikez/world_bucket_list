class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  before_action :authenticate_user!

  def show
    @destinations = current_user.destinations.sort_by { |dest| dest.name.downcase }
    render :show
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
