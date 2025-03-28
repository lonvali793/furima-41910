require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do

      it 'すべての条件が一致した場合は新規登録できる'do
    expect(@user).to be_valid
    end
  end
     
     
    context '新規登録できない場合' do

    it 'nicknameが空では登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'surnameが空では登録できない' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end
    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'surname_kanaが空では登録できない' do
      @user.surname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank")
      
    end
    it 'firstname_kanaが空では登録できない' do
      @user.firstname_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken') 
    end

    it "名前に数字が入っている場合は登録できない" do
      @user = FactoryBot.build(:user, firstname: "太郎123")
      expect(@user).not_to be_valid
    end

    it "名前にアルファベットが入っている場合は登録できない" do
      @user = FactoryBot.build(:user, firstname: "太郎abc")
      expect(@user).not_to be_valid
    end
  
    it "名字に数字が入っている場合は登録できない" do
      @user = FactoryBot.build(:user, surname: "山田123")
      expect(@user).not_to be_valid
    end

    it "名字にアルファベットが入っている場合は登録できない" do
      @user = FactoryBot.build(:user, surname: "山田abc")
      expect(@user).not_to be_valid
    end

    it "名前カナに数字が入っている場合は登録できない" do
      @user = FactoryBot.build(:user, firstname_kana: "タロウ123")
      expect(@user).not_to be_valid
    end

    it "名前カナにアルファベットが入っている場合は登録できない" do
      @user = FactoryBot.build(:user, firstname_kana: "タロウabc")
      expect(@user).not_to be_valid
    end

    it "名前カナに漢字が入っている場合は登録できない" do
      @user = FactoryBot.build(:user, firstname_kana: "タロウ太郎")
      expect(@user).not_to be_valid
    end

    it "名字カナに数字が入っている場合は登録できない" do
      @user = FactoryBot.build(:user, surname_kana: "ヤマダ123")
      expect(@user).not_to be_valid
    end

    it "名字カナにアルファベットが入っている場合は登録できない" do
      @user = FactoryBot.build(:user, surname_kana: "ヤマダabc")
      expect(@user).not_to be_valid
    end
    
    it "名字カナに漢字が入っている場合は登録できない" do
      @user = FactoryBot.build(:user, surname_kana: "ヤマダ山田")
      expect(@user).not_to be_valid
    end

    it "パスワードが数字のみの場合は登録できない" do
      @user = FactoryBot.build(:user, password: "1234567", password_confirmation: "1234567")
      expect(@user).not_to be_valid
    end

    
    it "パスワードがアルファベットのみの場合は登録できない" do
      @user = FactoryBot.build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      expect(@user).not_to be_valid
    end
  end
end
end

