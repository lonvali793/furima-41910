require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
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

      it "パスワードが一致したら登録できる" do
        user = FactoryBot.build(:user, password: "password123", password_confirmation: "password123")
        expect(user).to be_valid
      end
  
    it "名前が漢字とひらがなとカタカナのみで構成されている場合は登録できる" do
      user = FactoryBot.build(:user, firstname: Faker::Japanese::Name.first_name)
      expect(user.firstname.match?(/\A[ぁ-んァ-ヶ一-龥々ー]+\z/)).to be true
      expect(user).to be_valid
    end
  
    it "名前に数字が入っている場合は登録できない" do
      user = FactoryBot.build(:user, firstname: "#{Faker::Japanese::Name.first_name}123")
      expect(user).not_to be_valid
    end

    it "名前にアルファベットが入っている場合は登録できない" do
      user = FactoryBot.build(:user, firstname: "#{Faker::Japanese::Name.first_name}abc")
      expect(user).not_to be_valid
    end

    it "名字が漢字とひらがなとカタカナのみで構成されている場合は登録できる" do
      user = FactoryBot.build(:user, surname: Faker::Japanese::Name.last_name)
      expect(user.surname.match?(/\A[ぁ-んァ-ヶ一-龥々ー]+\z/)).to be true
      expect(user).to be_valid
    end
  
    it "名字に数字が入っている場合は登録できない" do
      user = FactoryBot.build(:user, surname: "#{Faker::Japanese::Name.last_name}123")
      expect(user).not_to be_valid
    end

    it "名前にアルファベットが入っている場合は登録できない" do
      user = FactoryBot.build(:user, surname: "#{Faker::Japanese::Name.last_name}abc")
      expect(user).not_to be_valid
    end

    it "パスワードがアルファベットと数字の混合の場合は登録できる" do
      user = FactoryBot.build(:user, password: "password123", password_confirmation: "password123")
      expect(user.password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)).to be true
      expect(user).to be_valid
    end
    
    it "パスワードが数字のみの場合は登録できない" do
      user = FactoryBot.build(:user, password: "1234567", password_confirmation: "1234567")
      expect(user).not_to be_valid
    end
    
    it "パスワードがアルファベットのみの場合は登録できない" do
      user = FactoryBot.build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      expect(user).not_to be_valid
    end

  end
end

