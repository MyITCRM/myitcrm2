FactoryGirl.define do
  sequence :username do |n|
    "foo#{n}"
  end
  sequence :name do |n|
    "Foo Bar#{n}"
  end
  sequence :email do |n|
    "foo#{n}@example.com"
  end
  sequence :phone do |n|
    "9999 99#{n}"
  end

  factory :user do
  username
  name
  email
  phone { rand(10000000) }
  mobile { rand(10000000) }
  fax { rand(10000000) }
  password "password"
  password_confirmation "password"
end
  end