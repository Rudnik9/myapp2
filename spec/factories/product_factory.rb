FactoryBot.define do
  sequence(:name) { |n| "#{n}" }
   factory :product do
    name
    description "The fastest example bike"
    colour "blue"
    price 210.0
  end
 end
