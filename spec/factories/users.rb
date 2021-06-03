FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '614test' }
    password_confirmation { password }
    family_name           { '柴崎' }
    first_name            { '友哉' }
    family_name_kana      { 'シバザキ' }
    first_name_kana       { 'トモヤ' }
    birth_day             { '1996-06-14' }
  end
end
