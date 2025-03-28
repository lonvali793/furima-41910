class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :surname, presence: true
         validates :firstname, presence: true
         validates :surname_kana, presence: true
         validates :firstname_kana, presence: true
         validates :birthday, presence: true

         with_options presence: true do
          # ひらがな、カタカナ、漢字のみ許可する
          validates :firstname, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid.Input full-width kanji and hiragana characters."}
          validates :surname, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width kanji and hiragana characters."}
          # カタカナのみ許可する
          validates :firstname_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
          validates :surname_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
          validates :password,  format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "is invalid. Password must contain at least one alphanumeric character."}
        end
end

