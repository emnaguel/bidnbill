class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) <<
  #     [:first_name, :last_name, :user_type, :client_type, :address, :company, :phone_number, :photo, :photo_cache]

  #   devise_parameter_sanitizer.for(:account_update) <<
  #     [:first_name, :last_name, :user_type, :client_type, :address, :company, :phone_number, :photo, :photo_cache]
  # end
end
