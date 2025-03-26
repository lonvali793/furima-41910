FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {|n| "test#{n}@example.com"}
    password              {'abc123'}
    surname              {'山田'}
    surname_kana         {'ヤマダ'}
    firstname             {'太郎'}
    firstname_kana         {'タロウ'}
    birthday            {'2000-01-01'}
    password_confirmation {password}
  end
end