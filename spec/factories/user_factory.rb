FactoryBot.define do

  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    first_name "Peter"
    last_name "Example"
    password "1234567890"
    admin false
  end

  factory :admin, class: User do
    email
    admin true
    first_name "John"
    last_name "Admin"
    password "1234567890a"
  end

end
