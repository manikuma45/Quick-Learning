require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'titleが空ならバリデーションが通らない' do
    question = build(:question, title: '')
    expect(question).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    question = build(:question, content: '')
    expect(question).not_to be_valid
  end
end
