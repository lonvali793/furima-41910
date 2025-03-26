FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.first_name }  # ランダムな名前
    email { Faker::Internet.email }      # ランダムなメールアドレス
    password { Faker::Internet.password(min_length: 6) }  # 8文字以上のランダムなパスワード
    password_confirmation { password }  # 確認用パスワードも同じ値にする

    surname { Faker::Name.last_name }        # ランダムな苗字
    firstname { Faker::Name.first_name }     # ランダムな名前
    surname_kana { "ヤマダ" }                 # ダミーのカナ
    firstname_kana { "タロウ" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }  # 18歳〜65歳の誕生日をランダムに設定
  end
end