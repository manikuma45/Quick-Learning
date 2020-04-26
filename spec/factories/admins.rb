FactoryBot.define do
  factory :admin do
    name { "admin1" }
    email { "admin1@test.test" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
