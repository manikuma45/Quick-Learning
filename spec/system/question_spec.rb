require 'rails_helper'

RSpec.describe Question, type: :system, js: true do
  before do
    @admin = create(:admin)
    @user = create(:user)
    @project = create(:project, admin_id: @admin.id)
    @project_admin = ProjectAdmin.create(admin_id: @admin.id, project_id: @project.id)
    @project_user = ProjectUser.create(user_id: @user.id, project_id: @project.id)
    @subject = create(:subject, project_id: @project.id)
    @part = create(:part, subject_id: @subject.id)
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Sign in'
  end

  describe 'question登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_project_subject_part_question_path(@project, @subject, @part, @user)
        fill_in 'title', with: 'question title'
        fill_in 'content', with: 'question content'
        click_button '登録する'
        visit user_question_questions_path
        expect(page).to have_content 'question title'
        expect(page).to have_content 'question content'
      end
    end
  end
end
