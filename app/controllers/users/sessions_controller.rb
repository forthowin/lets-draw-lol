class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  respond_to :js
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    if self.resource = warden.authenticate(auth_options)
      sign_in(resource_name, resource)
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
