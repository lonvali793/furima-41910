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
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
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
      @user.firstname = "太郎123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid.Input full-width kanji and hiragana characters.")
      
    end

    it "名前にアルファベットが入っている場合は登録できない" do
      @user.firstname = "太郎abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid.Input full-width kanji and hiragana characters.")
    end
  
    it "名字に数字が入っている場合は登録できない" do
      @user.surname = "山田123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname is invalid. Input full-width kanji and hiragana characters.")
    end

    it "名字にアルファベットが入っている場合は登録できない" do
      @user.surname = "山田abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname is invalid. Input full-width kanji and hiragana characters.")
    end

    it "名前カナに数字が入っている場合は登録できない" do
      @user.firstname_kana = "タロウ123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters.")
    end

    it "名前カナにアルファベットが入っている場合は登録できない" do
      @user.firstname_kana = "タロウabc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters.")
    end

    it "名前カナに漢字が入っている場合は登録できない" do
      @user.firstname_kana = "タロウ太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters.")
    end

    it "名字カナに数字が入っている場合は登録できない" do
      @user.surname_kana = "ヤマダ123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana is invalid. Input full-width katakana characters.")
    end

    it "名字カナにアルファベットが入っている場合は登録できない" do
      @user.surname_kana = "ヤマダabc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana is invalid. Input full-width katakana characters.")
    end
    
    it "名字カナに漢字が入っている場合は登録できない" do
      @user.surname_kana = "ヤマダ山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana is invalid. Input full-width katakana characters.")
    end

    it "パスワードが数字のみの場合は登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Password must contain at least one alphanumeric character.")
    end

    
    it "パスワードがアルファベットのみの場合は登録できない" do
      @user.password = "abcdefg"
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Password must contain at least one alphanumeric character.")
      

    end
  end
end
end

