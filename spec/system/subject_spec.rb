require 'rails_helper'

RSpec.describe Subject, type: :system, js: true do
  before do
    @admin = create(:admin)
    @project = create(:project, admin_id: @admin.id)
    @project_admin = ProjectAdmin.create(admin_id: @admin.id, project_id: @project.id)
    visit new_admin_session_path
    fill_in 'email', with: @admin.email
    fill_in 'password', with: @admin.password
    click_button 'Sign in'
  end

  describe 'subject登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit project_path(@project)
        fill_in 'input title', with: 'part title'
        click_button '登録する'
        expect(page).to have_content 'part title'
      end
    end
  end
end
