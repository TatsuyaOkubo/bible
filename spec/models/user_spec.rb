require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "passwordが英数字混合であり、6文字以上であれば登録できること" do
      @user.password = "aa3456"
      @user.password_confirmation = "aa3456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "aa123"
      @user.password_confirmation = "aa123"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "passwordが数字だけであれば登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "passwordがアルファベットだけであれば登録できないこと" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end
  end
end