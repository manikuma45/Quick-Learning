require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'nameが空ならバリデーションが通らない' do
    admin = build(:admin, name: "")
    expect(admin).not_to be_valid
  end

  it 'emailが空ならバリデーションが通らない' do
      admin = build(:admin, email: "")
    expect(admin).not_to be_valid
  end

  it 'passwordが空ならバリデーションが通らない' do
    admin = build(:admin, password: "")
    expect(admin).not_to be_valid
  end

  it 'password_confirmationが空ならバリデーションが通らない' do
    admin = build(:admin, password_confirmation: "")
    expect(admin).not_to be_valid
  end

end
