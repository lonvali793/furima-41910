FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.first_name }  # ランダムな名前
    email { Faker::Internet.email }      # ランダムなメールアドレス
    password { '1a' + Faker::Internet.password(min_length: 4) } # 6文字以上のランダムなパスワード
    password_confirmation { password }  # 確認用パスワードも同じ値にする

    surname {Faker::Japanese::Name.last_name }       
    firstname {  Faker::Japanese::Name.first_name }     
    surname_kana { "ヤマダ" }            
    firstname_kana { "タロウ" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }  # 18歳〜65歳の誕生日をランダムに設定
  end
end