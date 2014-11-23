class User::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:password, :password_confirmation, :email, :phone_number)
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  http_basic_authenticate_with(
    name: ENV['BASIC_AUTH_USERNAME'],
    password: ENV['BASIC_AUTH_PASSWORD']
  ) if ENV['BASIC_AUTH_USERNAME']

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      account_path
    else
      super
    end
  end

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end
end
