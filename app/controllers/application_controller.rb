# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :address, :user_type])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :phone_number, :address, :user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :address, :user_type])
  end
end
