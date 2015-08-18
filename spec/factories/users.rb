FactoryGirl.define do
  factory :user do
    id 1
    email "user@example.com"
    password "password"
    first_name "John"
    last_name "Doe"
  end
end
