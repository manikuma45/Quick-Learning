require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system, js: true do
  before do
    @admin = create(:admin)
    @project = create(:project, admin_id: @admin.id)
    @project_admin = ProjectAdmin.create(admin_id: @admin.id, project_id: @project.id)
  end

  describe 'adminユーザー登録関連' do
    context '新規adminユーザーのサインアップ' do
      it 'Sign Upページから参加中のプロジェクトページに遷移すること' do
        visit root_path
        first(:link, 'Administer here!').click
        fill_in 'email', with: @admin.email
        fill_in 'password', with: @admin.password
        click_button 'Sign in'
        expect(page).to have_content @admin.name
        expect(page).to have_content @project.title
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
