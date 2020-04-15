class ApplicationController < ActionController::Base
  # CSRF対策
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_admin!

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      if current_admin.invited_by_id.present?
        introduction_projects_path
      elsif current_admin.project_admin_projects.present?
        projects_path
      else
        new_project_path
      end
    when User
      if current_user.project_user_projects.empty?
        introduction_projects_path
      else
        projects_path
      end
    end
  end

  # ログイン後、プロジェクトの作成画面とプロジェクトの管理画面の何れかにルーティング
  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin
  #     if current_admin.invited_by_id.present?
  #       introduction_project_path(Admin.find(current_admin.invited_by_id).project_admin_projects.first)
  #     elsif current_admin.project_admin_projects.present?
  #       introduction_project_path(current_admin.project_admin_projects.first)
  #     else
  #       new_project_path
  #     end
  #   when User
  #     if current_user.project_user_projects.empty? && current_user.invited_by_id.present?
  #       project_path(id: User.find(current_user.invited_by_id).project_user_projects)
  #     else
  #       user_path(id: current_user.id)
  #     end
  #   end
  # end
# 一応コメントアウト
  # def after_sign_in_path_for(resource)
  #   introduction_projects_path
  # end

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
    # devise_invitableを使用する際に、他のモデルからでも招待ができるようにする
    def authenticate_inviter!
      authenticate_admin!(force: true)
    end
  end
end
