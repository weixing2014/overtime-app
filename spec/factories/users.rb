FactoryGirl.define do
  sequence :email do |n|
    "email_#{n}@factory.com"
  end

  factory :user do
    first_name 'Ordinary'
    last_name 'User'
    email
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :admin_user, class: 'AdminUser' do
    first_name 'Admin'
    last_name 'User'
    email
    password 'foobar'
    password_confirmation 'foobar'
  end
end
