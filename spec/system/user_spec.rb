require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system, js: true do
  before do
    @user = create(:user)
    @admin = create(:admin)
    @project = create(:project, admin_id: @admin.id)
    @project_user = ProjectUser.create(user_id: @user.id, project_id: @project.id)
  end

  describe 'userユーザー登録関連' do
    context '新規userユーザーのサインアップ' do
      it 'Sign Upページからマイページに遷移すること' do
        visit root_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button 'Sign in'
        expect(page).to have_content @user.email
        expect(page).to have_content @user.name
      end
    end
  end

  describe 'アクセス権限' do
    it '未ログインではプロジェクトページにアクセスできない' do
      visit projects_path
      expect(page).to have_current_path new_user_session_path
    end
  end
end
