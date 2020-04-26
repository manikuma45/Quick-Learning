require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    it 'nameが空ならバリデーションが通らない' do
      user = build(:user, name: "")
      expect(user).not_to be_valid
    end

    it 'emailが空ならバリデーションが通らない' do
      user = build(:user, email: "")
      expect(user).not_to be_valid
    end

    it 'passwordが空ならバリデーションが通らない' do
      user = build(:user, password: "")
      expect(user).not_to be_valid
    end

    it 'password_confirmationが空ならバリデーションが通らない' do
      user = build(:user, password_confirmation: "")
      expect(user).not_to be_valid
    end
  end
end
