require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'contentが空ならバリデーションが通らない' do
    comment = build(:comment, content: '')
    expect(comment).not_to be_valid
  end
end
