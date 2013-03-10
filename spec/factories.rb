FactoryGirl.define do
  factory :user do |f|
  f.sequence(:username) { |n| "foo#{n}"}
	f.sequence(:email) { |n| "foo#{n}@example.com"}
  f.password "password"

end
end