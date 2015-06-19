FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    email
    user_name 'testuser'
    xbox_name 'testuser'
    password "password"
    password_confirmation "password"
    confirmed_at Time.now
    time_zone 'Eastern Time (US & Canada)'
  end

end
