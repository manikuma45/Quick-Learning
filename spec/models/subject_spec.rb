require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'titleが空ならバリデーションが通らない' do
    subject = build(:subject, title: '')
    expect(subject).not_to be_valid
  end
end
