class ApplicationController < ActionController::Base
  # CSRF対策
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!

  # ログイン後、プロフィール画面に移動する
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path(id: current_admin.id)
    when User
      user_path(id: current_user.id)
    end
  end
  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:invite, keys: [:name])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name])
  end
end
