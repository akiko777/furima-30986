FactoryBot.define do

  factory :user do
    nickname             {"hanako"}
    email                {Faker::Internet.free_email}
    password             {"00000a"}
    password_confirmation{"00000a"}
    family_name          {"田中"}
    first_name           {"花子"}
    family_name_kana     {"タナカ"}
    first_name_kana      {"ハナコ"}
    birthday             {"2000-03-03"}
  end
end