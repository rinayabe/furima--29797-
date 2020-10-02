FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    password_confirmation { password }
    family_name           { 'あいう' }
    first_name            { 'えお' }
    family_name_kana      { 'アイウ' }
    first_name_kana       { 'エオ' }
    birthday              { '19990104' }
  end
end
