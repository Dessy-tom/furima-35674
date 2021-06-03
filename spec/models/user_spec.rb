require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it '全ての情報が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    # ここから空では登録できない
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dayが空では登録できないこと' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    # ここからパスワードの詳細
    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'test12'
      @user.password_confirmation = 'test12'
      expect(@user).to be_valid
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが半角英数字混合出ないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    # ここからユーザー名の詳細
    it 'family_nameが英数では登録できない' do
      @user.family_name = 'tomo2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it 'first_nameが英数では登録できない' do
      @user.first_name = 'tomo2'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'family_name_kanaがカタカナでないと登録できない' do
      @user.family_name_kana = '柴崎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it 'first_name_kanaがカタカナでないと登録できない' do
      @user.first_name_kana = 'ともや'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end


    # ここからemail詳細
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@がないと登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  end
end

