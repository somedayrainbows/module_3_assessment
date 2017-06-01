FactoryGirl.define do
  factory :item do
    name Faker::Music.instrument
    description Faker::Hipster.paragraph
    image_url Faker::Fillmurray.image
  end
end
