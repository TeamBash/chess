FactoryGirl.define do
  factory :game do
    name 'Skippy'
    white_user_id 1
    black_user_id 2
  end

  factory :user do
    sequence :email do |n|
      "haylic#{n}@gmail.com"
    end
    password 'omglolhahaha'
    password_confirmation 'omglolhahaha'
  end
end
