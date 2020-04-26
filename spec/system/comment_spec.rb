require 'rails_helper'

RSpec.describe Comment, type: :system, js: true do
  before do
    @admin = create(:admin)
    @user = create(:user)
    @project = create(:project, admin_id: @admin.id)
    @project_admin = ProjectAdmin.create(admin_id: @admin.id, project_id: @project.id)
    @project_user = ProjectUser.create(user_id: @user.id, project_id: @project.id)
    @subject = create(:subject, project_id: @project.id)
    @part = create(:part, subject_id: @subject.id)
    @question = create(:question, part_id: @part.id, project_id: @project.id, subject_id: @subject.id, user_id: @user.id)
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Sign in'
  end

  describe 'comment登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit project_subject_part_question_path(@project, @subject, @part, @question)
        fill_in 'content', with: 'comment content'
        click_button '登録する'
        expect(page).to have_content 'comment content'
      end
    end
  end
end
