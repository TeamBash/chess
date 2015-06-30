FactoryGirl.define do
  factory :game do
    name 'Skippy'
    
    association :white_user, factory: :user, email: "white_user@gmail.com"
    association :black_user, factory: :user, email: "black_user@gmail.com"
  end

  factory :user do
    sequence :email do |n|
      "haylic#{n}@gmail.com"
    end
    password 'omglolhahaha'
    password_confirmation 'omglolhahaha'
  end
end
