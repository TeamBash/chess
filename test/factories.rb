FactoryGirl.define do
  factory :game do
    name 'Skippy'
  end

  factory :user do
    sequence :email do |n|
      "haylic#{n}@gmail.com"
    end
    password 'omglolhahaha'
    password_confirmation 'omglolhahaha'
  end
end
