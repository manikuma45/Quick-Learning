require 'rails_helper'

RSpec.describe Part, type: :model do
  it 'titleが空ならバリデーションが通らない' do
    part = build(:part, title: '')
    expect(part).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    part = build(:part, content: '')
    expect(part).not_to be_valid
  end
end
