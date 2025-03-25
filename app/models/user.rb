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
         validates :email, presence: true, format: { with: /@/, message: "@ を含めてください" }
         validates :password, presence: true, length: { minimum: 6}
end

