require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'nameが空ならバリデーションが通らない' do
    project = build(:project, title: '')
    expect(project).not_to be_valid
  end
end
