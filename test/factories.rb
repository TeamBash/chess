FactoryGirl.define do
  factory :game do
    name 'Skippy'
  end

  factory :user do
    sequence(:email) { |n| "email#{n}@factory.com" }
    password 'omglolhahaha'
    password_confirmation 'omglolhahaha'
  end

  # game generates all the pieces but just in case...
  factory :piece do
    association :game
    association :user
  end

end
